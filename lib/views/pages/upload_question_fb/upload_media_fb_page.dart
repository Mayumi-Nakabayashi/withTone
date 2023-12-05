import 'package:flutter/material.dart';
import 'package:withtone/views/pages/upload_question_fb/upload_comment_fb_page.dart';

/// フィードバック動画・画像を撮影する画面
class UploadMediaFbPage extends StatefulWidget {
  const UploadMediaFbPage({super.key});

  static const String path = '/upload_media_fb';

  @override
  State<UploadMediaFbPage> createState() => _UploadMediaFbPageState();
}

class _UploadMediaFbPageState extends State<UploadMediaFbPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.pink), // TODO: ここにカメラ画像を表示する
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBar(backgroundColor: Colors.transparent),
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VideoSideButton(
                      onPressed: () {},
                      label: 'Effects',
                      assetPath: 'assets/logo/Effects_Illustration.png',
                    ),
                    // TODO: いい感じのアニメーションをつけるビデオボタンを作る
                    ElevatedButton(
                      onPressed: () => {},
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
            ],
          ),
          // 暫定で次へボタンを画面中央に表示
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(UploadCommentFbPage.path),
              child: const Text('次へ'),
            ),
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
