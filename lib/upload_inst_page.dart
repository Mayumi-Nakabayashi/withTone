import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/components/text/orange_text.dart';
import 'package:withtone/views/pages/upload_question_page.dart';

class UploadInstPage extends StatefulWidget {
  const UploadInstPage({super.key});

  static const String path = '/upload_inst';

  @override
  State<UploadInstPage> createState() => _UploadInstPageState();
}

class ButtonItem {
  final String label;
  bool isSelected = false;
  ButtonItem({required this.label, this.isSelected = false});
}

class _UploadInstPageState extends State<UploadInstPage> {
  List<ButtonItem> buttonItems = [
    ButtonItem(label: 'ギター'),
    ButtonItem(label: 'ピアノ'),
    ButtonItem(label: 'その他'),
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
          Container(color: const Color.fromRGBO(33, 33, 33, 0.93)),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                ///TODOバックボタンのアイコンを変更or相談する。
                ///TODOバックボタンのロジックを書く
                const BackButton(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 190,
                ),
                const OrangeText(label: 'あなたの楽器を教えてください'),

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: PrimaryButton(
                    label: '次へ',
                    onPressed: () => Navigator.pushNamed(
                      context,
                      UploadQuestionPage.path,
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
