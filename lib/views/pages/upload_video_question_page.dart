import 'package:flutter/material.dart';

class UploadVideoQuestionPage extends StatefulWidget {
  const UploadVideoQuestionPage({super.key});

  static const String path = '/upload_video_question';

  @override
  State<UploadVideoQuestionPage> createState() =>
      _UploadVideoQuestionPageState();
}

class ButtonItem {
  final String label;
  bool isSelected = false;
  ButtonItem({required this.label, this.isSelected = false});
}

class _UploadVideoQuestionPageState extends State<UploadVideoQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/page_images/upload_videoq.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('戻る'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
