import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/models/post.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/pages/home_page.dart';

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
            // TODO: ここに動画を表示する
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
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
