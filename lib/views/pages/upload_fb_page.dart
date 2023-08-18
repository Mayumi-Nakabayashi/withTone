import 'package:flutter/material.dart';
import 'package:withtone/views/components/change_button.dart';
import 'package:withtone/views/components/text/orange_text.dart';

class UploadFbPage extends StatefulWidget {
  const UploadFbPage({super.key});

  static const String path = '/uploadFb';

  @override
  State<UploadFbPage> createState() => _UploadFbPageState();
}

class _UploadFbPageState extends State<UploadFbPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/page_images/content.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color.fromRGBO(33, 33, 33, 0.93),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 190,
                ),
                const OrangeText(label: 'どんなフィードバックが欲しいですか？'),
                const SizedBox(
                  height: 60,
                ),
                ChangeButton(
                  label: '演奏に対してのフィードバックが欲しい',
                  onPressed: () {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                const ChangeButton(
                  label: '技術的な観点でのアドバイスが欲しい',
                ),
                const SizedBox(
                  height: 18,
                ),
                const ChangeButton(
                  label: 'おすすめの練習を教えて欲しい',
                ),
                const SizedBox(
                  height: 184,
                ),
                Center(
                  child: SizedBox(
                    height: 42,
                    width: 260,
                    child: ElevatedButton(
                      ///TODO画面を繋げる。
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 87, 146, 1),
                        // グラデーション色を定義
                      ),
                      child: const Text(
                        '次へ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
