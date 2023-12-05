import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/pages/upload_feedback/upload_thanks_fb_page.dart';

/// コミュニティからの投稿動画にFBコメントをつける画面
class UploadCommentFbPage extends StatefulWidget {
  const UploadCommentFbPage({super.key, withMedia});

  static const String path = '/upload_fb_comment';

  @override
  State<UploadCommentFbPage> createState() => _UploadCommentFbPageState();
}

class _UploadCommentFbPageState extends State<UploadCommentFbPage> {
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
            // TODO: ここに画像or動画がある場合は表示する
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: 'コメントを投稿',
              onPressed: () {
                Navigator.of(context).pushNamed(UploadThanksFbPage.path);
              },
            )
          ]),
        ),
      ),
    );
  }
}
