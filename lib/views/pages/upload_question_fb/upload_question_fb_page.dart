import 'package:flutter/material.dart';
import 'package:withtone/views/components/text/orange_text.dart';
import 'package:withtone/views/pages/upload_question_fb/upload_fb_comment_page.dart';

class UploadQuestionFBPage extends StatefulWidget {
  const UploadQuestionFBPage({super.key});

  static const String path = '/upload_question_fb';

  @override
  State<UploadQuestionFBPage> createState() => _UploadQuestionFBPageState();
}

class ButtonItem {
  final String label;
  final String path;
  bool isSelected = false;
  ButtonItem(
      {required this.label, required this.path, this.isSelected = false});
}

class _UploadQuestionFBPageState extends State<UploadQuestionFBPage> {
  List<ButtonItem> buttonItems = [
    ButtonItem(label: 'はい', path: UploadFbCommentPage.path),
    ButtonItem(label: 'いいえ', path: UploadFbCommentPage.path),
  ];
  List<ButtonItem> buttonItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/page_images/upload_thankyouq.jpg',
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
                            Navigator.pushNamed(
                              context,
                              buttonItems[index].path,
                            );
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
