import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/providers/camera/camera.dart';
import 'package:withtone/providers/media/media.dart';
import 'package:withtone/views/pages/upload_commentq/upload_commentq_page.dart';

/// 質問動画を撮影する画面
class UploadVideoQuestionPage extends ConsumerStatefulWidget {
  const UploadVideoQuestionPage({Key? key}) : super(key: key);
  static const String path = '/upload_video_question';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadVideoQuestionPageState();
}

class _UploadVideoQuestionPageState
    extends ConsumerState<UploadVideoQuestionPage> {
  /// カメラコントローラ
  late CameraController? _controller;

  /// カメラコントローラの初期化処理
  ///
  /// 参考: https://docs.flutter.dev/cookbook/plugins/picture-using-camera
  late Future<void> _initializeControllerFuture;

  /// カメラの撮影モード (画像 or 動画)
  bool isVideo = false;

  /// カメラのレンズ向き
  CameraLensDirection cameraLensDirection = CameraLensDirection.front;

  /// カメラが動画撮影中かどうか
  bool isRecording = false;

  /// カメラのレンズ向きがfrontかどうか
  bool get isFront => cameraLensDirection == CameraLensDirection.front;

  @override
  void initState() {
    super.initState();
    _controller = createCameraController(ref);
    _cameraControllerAddListener(_controller);
    _initializeControllerFuture = _controller?.initialize() ?? Future.value();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Stack(
            children: [
              FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Stack(
                      children: [
                        if (_controller != null)
                          Center(child: CameraPreview(_controller!)),
                        _BottomButtonBar(
                          children: [
                            _VideoSideButton.effects(
                              onPressed: () {},
                            ),
                            _CameraButton(
                              isVideo: isVideo,
                              isRecording: isRecording,
                              startVideo: () =>
                                  _onPressStartVideoRecordingButton(),
                              stopVideo: () => _onPressStopVideoRecordingButton(
                                context,
                                ref,
                              ),
                              takePicture: () => _onPressTakePictureButton(
                                context,
                                ref,
                              ),
                            ),
                            _VideoSideButton.upload(onPressed: null),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _GreyIconButton(
                  iconData: Icons.arrow_back,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              _LeftButtonsContainer(
                children: [
                  _GreyIconButton(
                    iconData: isVideo
                        ? Icons.video_camera_front
                        : Icons.camera_alt_rounded,
                    onPressed: _changeCameraMode,
                  ),
                  _GreyIconButton(
                    iconData: isFront ? Icons.camera_front : Icons.camera_rear,
                    onPressed:
                        _controller != null && _controller!.value.isInitialized
                            ? _changeCameraLensDirection
                            : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// カメラコントローラを作成する
  CameraController? createCameraController(WidgetRef ref) {
    log('createCameraController start');
    try {
      final camera = ref.read(selectedCameraProvider());
      if (camera == null) {
        return null;
      }
      return CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
    } on CameraException catch (e) {
      log("code: ${e.code}, description: ${e.description}");
      return null;
    }
  }

  /// カメラコントローラ群のリスナ登録
  void _cameraControllerAddListener(
    CameraController? controller,
  ) {
    log('_cameraControllerAddListener start');
    controller?.addListener(
      () => setState(() {
        isRecording = _controller != null &&
            _controller!.value.isInitialized &&
            _controller!.value.isRecordingVideo;
      }),
    );
  }

  /// 写真撮影ボタン押下時処理
  ///
  /// 画像を保存して、次の画面に遷移する
  Future<void> _onPressTakePictureButton(
    BuildContext context,
    WidgetRef ref,
  ) async {
    log('_onPressTakePictureButton start');

    XFile? file;
    try {
      file = await _controller?.takePicture();
    } finally {
      ref.read(mediaNotifierProvider.notifier).update(file);
      Navigator.of(context).pushNamed(UploadCommentqPage.path);
    }
    return;
  }

  /// 動画撮影開始ボタン押下時処理
  ///
  /// 動画撮影を開始する
  Future<void> _onPressStartVideoRecordingButton() async {
    log('_onPressStartVideoRecordingButton start');
    await _controller?.startVideoRecording();
    return;
  }

  /// 動画撮影停止ボタン押下時処理
  ///
  /// 動画を保存して、次の画面に遷移する
  Future<void> _onPressStopVideoRecordingButton(
    BuildContext context,
    WidgetRef ref,
  ) async {
    log('_onPressStopVideoRecordingButton start');

    await _controller?.stopVideoRecording().then((value) {
      ref.read(mediaNotifierProvider.notifier).update(value);
      Navigator.of(context).pushNamed(UploadCommentqPage.path);
    }).onError((error, stackTrace) {
      log('_onPressStopVideoRecordingButton error: $error, stackTrace: $stackTrace');
    });
    return;
  }

  /// カメラのモードを変更する
  void _changeCameraMode() {
    log('_changeCameraMode start');
    setState(() {
      isVideo = !isVideo;
      // ビデオ撮影中 → 画像撮影に切り替えた場合、ビデオ撮影を停止する
      if (isRecording) {
        _controller?.stopVideoRecording();
      }
    });
  }

  /// カメラの向きを変更する
  void _changeCameraLensDirection() {
    log('_changeCameraLensDirection start');
    setState(() {
      cameraLensDirection =
          isFront ? CameraLensDirection.back : CameraLensDirection.front;
      final camera =
          ref.read(selectedCameraProvider(direction: cameraLensDirection));
      if (camera != null) {
        _controller?.setDescription(camera);
        _cameraControllerAddListener(_controller);
      }
    });
  }
}

/// 画面上部のボタン
class _GreyIconButton extends StatelessWidget {
  final IconData? iconData;
  final void Function()? onPressed;

  const _GreyIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData, color: Colors.grey),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.grey.withOpacity(0.25),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

/// トップ右上に表示するボタン群のレイアウト
class _LeftButtonsContainer extends StatelessWidget {
  const _LeftButtonsContainer({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

/// 画面下部に表示するカメラのボタン群
class _BottomButtonBar extends StatelessWidget {
  const _BottomButtonBar({
    required this.children,
  });

  /// 子要素
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _BottomButtonBarContainer(children: children),
      ],
    );
  }
}

/// [_BottomButtonBar] で使う1行の余白感を整えるコンテナ
class _BottomButtonBarContainer extends StatelessWidget {
  const _BottomButtonBarContainer({
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }
}

/// ビデオの左右にあるボタン
class _VideoSideButton extends StatelessWidget {
  final String label;
  final String assetPath;
  final void Function()? onPressed;

  const _VideoSideButton({
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

  factory _VideoSideButton.effects({
    required void Function()? onPressed,
  }) {
    return _VideoSideButton(
      label: 'Effects',
      assetPath: 'assets/logo/Effects_Illustration.png',
      onPressed: onPressed,
    );
  }

  factory _VideoSideButton.upload({
    required void Function()? onPressed,
  }) {
    return _VideoSideButton(
      label: 'Upload',
      assetPath: 'assets/logo/Upload_Illustration.png',
      onPressed: onPressed,
    );
  }
}

/// 撮影ボタン
class _CameraButton extends StatelessWidget {
  const _CameraButton({
    Key? key,
    required this.isVideo,
    required this.isRecording,
    required this.startVideo,
    required this.stopVideo,
    required this.takePicture,
  }) : super(key: key);

  final bool isVideo;
  final bool isRecording;
  final Function()? stopVideo;
  final Function()? startVideo;
  final Function()? takePicture;

  @override
  Widget build(BuildContext context) {
    IconData? iconData;
    void Function()? onPressed;
    if (isVideo) {
      iconData = isRecording ? Icons.stop : Icons.videocam;
      onPressed = isRecording ? stopVideo : startVideo;
    } else {
      iconData = Icons.camera_alt;
      onPressed = takePicture;
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow[800],
        padding: const EdgeInsets.all(20),
      ),
      child: Icon(iconData, size: 50),
    );
  }
}
