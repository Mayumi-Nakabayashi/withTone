import 'package:flutter/material.dart';
import 'package:withtone/views/components/text/orange_text.dart';
import 'package:withtone/views/pages/upload_video_question/upload_video_question_page.dart';

class UploadQuestionPage extends StatefulWidget {
  const UploadQuestionPage({super.key});

  static const String path = '/upload_question';

  @override
  State<UploadQuestionPage> createState() => _UploadQuestionPageState();
}

class ButtonItem {
  final String label;
  bool isSelected = false;
  ButtonItem({required this.label, this.isSelected = false});
}

class _UploadQuestionPageState extends State<UploadQuestionPage> {
  List<ButtonItem> buttonItems = [
    ButtonItem(label: 'はい'),
    ButtonItem(label: 'いいえ'),
  ];
  List<ButtonItem> buttonItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/page_images/upload_inst.jpg',
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
                const OrangeText(label: '動画や写真で質問しますか？'),

                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: buttonItems.length,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              for (var buttonItem in buttonItems) {
                                buttonItem.isSelected = false;
                              }
                              buttonItems[index].isSelected = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromWidth(double.maxFinite),
                            // ボタンの背景色を設定
                            backgroundColor: Colors.transparent,
                            // ボタンの文字色を設定
                            side: BorderSide(
                              color: buttonItems[index].isSelected
                                  ? const Color.fromRGBO(0, 87, 146, 1)
                                  : Colors.white,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            buttonItems[index].label,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    UploadVideoQuestionPage.path,
                  ),
                  child: const Text('/upload_videoq への導線, 開発で仮置き'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
