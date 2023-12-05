import 'dart:async';

import 'package:flutter/material.dart';
import 'package:withtone/views/pages/home_page.dart';

/// フィードバック動画・画像を撮影する画面
class UploadThanksFbPage extends StatefulWidget {
  const UploadThanksFbPage({super.key});

  static const String path = '/upload_thanks_fb';

  @override
  State<UploadThanksFbPage> createState() => _UploadThanksFbPageState();
}

class _UploadThanksFbPageState extends State<UploadThanksFbPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    /// TODO: 3秒後に feedback_video_page へ遷移する
    timer = Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomePage.path);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          /// TODO: アップロードした画像か動画のサムネに置き換える。コメントのみの場合のデザインは確認してください。
          image: DecorationImage(
            image: AssetImage('assets/page_images/upload_thankyouq.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
