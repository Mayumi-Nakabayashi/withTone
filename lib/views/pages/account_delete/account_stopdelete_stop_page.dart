import 'package:flutter/material.dart';
import 'package:withtone/views/pages/account_delete/pop_button.dart';
import 'package:withtone/views/pages/account_delete/title_text_widget.dart';

class AccountStopdeleteStopPage extends StatelessWidget {
  const AccountStopdeleteStopPage({super.key});

  static const String path = '/account_stopdelete_stap_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 78),
            const PopButton(),
            const SizedBox(height: 32),
            const TitleTextWidget(title: '木村なつみさん：このアカウントを\n利用停止にしますか？'),
            const SizedBox(height: 21),
            const SizedBox(
              width: 340,
              child: Text(
                'アカウントを利用停止にすると',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '・誰もあなたのアカウントとコンテンツを見ることができません。',
                  style: TextStyle(fontSize: 11),
                ),
                Text(
                  '・同じログイン情報を使用すると、いつでもアカウントを復元させることができます。',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 55),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 325,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: const Color(0xff005792)),
                      child: const Text(
                        'アカウントを利用停止にする',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
