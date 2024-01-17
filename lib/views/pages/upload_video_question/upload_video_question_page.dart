import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/views/pages/upload_commentq/upload_commentq_page.dart';

// 画像と動画のモードの切り替え状態
enum CameraMode { image, video }

// 画像と動画のモードの切り替え状態を管理するプロバイダー
final cameraModeProvider =
    StateProvider.autoDispose<CameraMode>((ref) => CameraMode.image);

// 撮影した画像を保存するプロバイダー
final imageProvider = StateProvider<XFile?>((ref) => null);

// カメラコントローラを取得するプロバイダー
// この画面でしか使わないので、一旦ここに書いておく
final cameraControllerProvider =
    FutureProvider.autoDispose<CameraController>((ref) async {
  // 利用可能なカメラの一覧を取得
  final cameras = await availableCameras();
  // 基本的には、※0: 外カメ　1: 内カメ
  final camera = cameras[1];
  final controller = CameraController(
    camera,
    ResolutionPreset.medium,
  );
  // プロバイダーの破棄時にカメラコントローラを破棄する
  ref.onDispose(() {
    controller.dispose();
  });

  // コントローラを初期化
  await controller.initialize();
  return controller;
});

/// 質問動画を撮影する画面
class UploadVideoQuestionPage extends ConsumerWidget {
  const UploadVideoQuestionPage({super.key});

  static const String path = '/upload_video_question';

  /// 写真撮影ボタン押下時処理
  Future<XFile> onPressTakePictureButton(
      BuildContext context, CameraController controller) async {
    return await controller.takePicture();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraController = ref.watch(cameraControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.flip_camera_android),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          cameraController.when(
              // 撮影プレビュー
              data: (data) => CameraPreview(data),
              error: (err, stack) => Text('Error: $err'),
              // 読込中プログレス
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VideoSideButton(
                      onPressed: () {},
                      label: 'Effects',
                      assetPath: 'assets/logo/Effects_Illustration.png',
                    ),
                    // 撮影ボタン
                    ElevatedButton(
                      onPressed: () => {
                        cameraController.when(
                          data: (data) {
                            onPressTakePictureButton(context, data)
                                .then((value) {
                              ref.read(imageProvider.notifier).state = value;
                              Navigator.of(context)
                                  .pushNamed(UploadCommentqPage.path);
                            });
                          },
                          error: (err, stack) => print("error: $err"),
                          // 読込中は何も表示しない
                          loading: () => print("loading"),
                        ),
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.yellow[800],
                        padding: const EdgeInsets.all(20),
                      ),
                      child: const Icon(Icons.camera_alt, size: 50),
                    ),
                    VideoSideButton(
                      onPressed: () {},
                      label: 'Upload',
                      assetPath: 'assets/logo/Upload_Illustration.png',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt_rounded, color: Colors.grey),
                  Switch(
                      activeColor: Colors.white,
                      value: ref.watch(cameraModeProvider) == CameraMode.video,
                      onChanged: (value) {
                        print("value: $value");
                        ref.watch(cameraModeProvider.notifier).state =
                            value ? CameraMode.video : CameraMode.image;
                      }),
                  const Icon(Icons.video_camera_front, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ビデオの左右にあるボタン
class VideoSideButton extends StatelessWidget {
  final String label;
  final String assetPath;
  final void Function()? onPressed;

  const VideoSideButton({
    Key? key,
    required this.label,
    required this.assetPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            assetPath,
            fit: BoxFit.cover,
          ),
          Text(label, style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
