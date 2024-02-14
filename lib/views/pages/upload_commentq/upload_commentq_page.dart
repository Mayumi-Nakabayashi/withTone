import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:withtone/models/post/post.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/pages/home_page.dart';
import 'package:withtone/views/pages/upload_video_question/upload_video_question_page.dart';

/// メディアをファイルとして提供するプロバイダー
final mediaFileProvider = Provider((ref) {
  final mediaPath = ref.watch(mediaProvider)?.path;
  print("mediaPath: $mediaPath");
  if (mediaPath == null || mediaPath == '') {
    throw Exception('メディアがありません');
  }
  return File(mediaPath);
});

/// ビデオ再生中かどうかを管理するプロバイダー
final isPlayingProvider = StateProvider((ref) => false);

/// ビデオプレーヤーコントローラを取得するプロバイダー
final videoPlayerControllerProvider =
    FutureProvider.autoDispose<VideoPlayerController>((ref) async {
  final controller = VideoPlayerController.file(ref.watch(mediaFileProvider));

  // コントローラを初期化
  await controller.initialize();

  // 再生状態をプロバイダーに反映
  controller.addListener(() {
    ref.read(isPlayingProvider.notifier).state = controller.value.isPlaying;
  });

  // プロバイダーの破棄時にカメラコントローラを破棄する
  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});

/// 質問動画にコメントをつける画面

class UploadCommentqPage extends ConsumerStatefulWidget {
  const UploadCommentqPage({super.key});

  static const String path = '/upload_commentq';

  @override
  ConsumerState<UploadCommentqPage> createState() => _UploadCommentqPageState();
}

class _UploadCommentqPageState extends ConsumerState<UploadCommentqPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('コメント')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(
              width: double.infinity,
              child: Text('#ハッシュタグ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLength: 300,
              maxLines: null,
            ),
            const SizedBox(height: 20),
            const _MediaPreview(),
            const SizedBox(height: 20),
            PrimaryButton(
              label: '質問を投稿',
              onPressed: () {
                // 仮投稿作成
                final postRef = FirebaseFirestore.instance.collection('posts');
                final docId = postRef.doc().id;
                final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
                final post = Post(
                  id: docId,
                  uid: uid,
                  title: '【超初心者】バイオリンを買ってから７日間の練習メニュー',
                  body: _bodyController.text,
                  // 先に動画をアップロードして、そのURLを入れる
                  movieUrl: 'https://www.youtube.com/watch?v=8HqQ3XgxBhY',
                  tags: ['#バイオリン', '#初心者', '#質問歓迎'],
                  // これは自動で入れたい
                  createdAt: DateTime.now(), // これだとサーバー時刻じゃない
                  updatedAt: DateTime.now(),
                );

                postRef.doc(docId).set(post.toJson());

                // いいねをつける 別にここでやらなくても良いが、データ型の確認の為
                postRef.doc(docId).collection('favorite').add({
                  'users': [uid]
                });
                Navigator.of(context).pushNamed(HomePage.path);
              },
            )
          ]),
        ),
      ),
    );
  }
}

/// メディアの表示パーツ
class _MediaPreview extends ConsumerWidget {
  const _MediaPreview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVideo = ref.watch(cameraModeProvider) == CameraMode.video;
    return isVideo ? const _VideoPreview() : const _ImagePreview();
  }
}

/// 画像の表示パーツ
class _ImagePreview extends ConsumerWidget {
  const _ImagePreview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image.file(ref.watch(mediaFileProvider));
  }
}

/// ビデオプレーヤーの表示パーツ
class _VideoPreview extends ConsumerWidget {
  const _VideoPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(videoPlayerControllerProvider).value;
    if (controller == null) {
      return const SizedBox.shrink();
    }
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(controller),
          const _ControlsOverlay(),
          VideoProgressIndicator(controller, allowScrubbing: true),
        ],
      ),
    );
  }
}

/// ビデオプレーヤーのオーバーレイ
class _ControlsOverlay extends ConsumerWidget {
  const _ControlsOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(videoPlayerControllerProvider).value;
    final isPlaying = ref.watch(isPlayingProvider);
    if (controller == null) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: <Widget>[
        isPlaying
            ? const SizedBox.shrink()
            : const ColoredBox(
                color: Colors.black12,
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
        GestureDetector(
          onTap: () => isPlaying ? controller.pause() : controller.play(),
        ),
      ],
    );
  }
}
