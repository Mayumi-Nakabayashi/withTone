import 'package:flutter/material.dart';
import 'package:withtone/views/components/text/orange_text.dart';

class UploadFbPage extends StatefulWidget {
  const UploadFbPage({super.key});

  static const String path = '/uploadFb';

  @override
  State<UploadFbPage> createState() => _UploadFbPageState();
}

class ButtonItem {
  final String label;
  ButtonItem({required this.label});

  bool isSelected = false;
}

class _UploadFbPageState extends State<UploadFbPage> {
  List<ButtonItem> buttonItems = [
    ButtonItem(label: '演奏に対してのフィードバックが欲しい'),
    ButtonItem(label: 'おすすめの練習方法を教えてほしい'),
    ButtonItem(label: 'ティップスを紹介する！'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/page_images/upload_fb.jpg',
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
                  height: 50,
                ),

                ///TODOバックボタンのアイコンを変更or相談する。
                ///TODOバックボタンのロジックを書く
                const BackButton(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 190,
                ),
                const OrangeText(label: 'あなたの希望を教えてください'),
                const SizedBox(
                  height: 60,
                ),
                Wrap(
                  runSpacing: 20,
                  children: buttonItems.map((item) {
                    return ElevatedButton(
                      onPressed: () => setState(() {
                        item.isSelected = !item.isSelected;
                      }),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        // ボタンの背景色を設定
                        backgroundColor: Colors.transparent,
                        // ボタンの文字色を設定
                        side: BorderSide(
                          color: item.isSelected
                              ? const Color.fromRGBO(0, 87, 146, 1)
                              : Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
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
