import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/pages/home_page.dart';

/// 質問動画にコメントをつける画面
class UploadCommentqPage extends StatefulWidget {
  const UploadCommentqPage({super.key});

  static const String path = '/upload_commentq';

  @override
  State<UploadCommentqPage> createState() => _UploadCommentqPageState();
}

class ButtonItem {
  final String label;
  bool isSelected = false;
  ButtonItem({required this.label, this.isSelected = false});
}

class _UploadCommentqPageState extends State<UploadCommentqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('コメント')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(
              width: double.infinity,
              child: Text('#ハッシュタグ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            const TextField(
              decoration: InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLength: 300,
              maxLines: null,
            ),
            const SizedBox(height: 20),
            // TODO: ここに動画を表示する
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: '質問を投稿',
              onPressed: () {
                Navigator.of(context).pushNamed(HomePage.path);
              },
            )
          ]),
        ),
      ),
    );
  }
}
