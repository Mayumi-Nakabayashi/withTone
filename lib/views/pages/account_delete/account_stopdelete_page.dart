import 'package:flutter/material.dart';
import 'package:withtone/views/components/border_widget.dart';
import 'package:withtone/views/pages/account_delete/account_stopdelete_delete_page.dart';
import 'package:withtone/views/pages/account_delete/account_stopdelete_stop_page.dart';
import 'package:withtone/views/pages/account_delete/pop_button.dart';
import 'package:withtone/views/pages/account_delete/title_text_widget.dart';

class AccountStopdeletePage extends StatelessWidget {
  const AccountStopdeletePage({super.key});
  static const String path = '/account_stopdelete_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 78),
            const PopButton(),
            const SizedBox(height: 32),
            const TitleTextWidget(title: '利用停止または削除をしますか？'),
            const SizedBox(height: 11),
            const SizedBox(
              width: 340,
              child: Text(
                '一時的にwithToneを離れる場合は、アカウントを利用停止にしてください。アカウントの削除をおこなうと、30日後にはアカウントを復元できなくなります。',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AccountStopdeleteStopPage.path),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 259,
                      child: Text(
                        '利用停止または削除をしますか？',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff161722),
                            fontWeight: FontWeight.w400),
                      )),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            ),
            const SizedBox(height: 11),
            const SizedBox(
              width: 340,
              child: Text(
                '保存されているすべてのコンテンツを含めて、誰もあなたのアカウントを見ることができません。アカウントの復活とコンテンツの復元は、いつでもかの杖す。',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),
            const BorderWidget(color: Color(0xffD0D1D3)),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, AccountStopdeleteDeletePage.path),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 259,
                      child: Text(
                        'アカウントを完全に削除',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff161722),
                            fontWeight: FontWeight.w400),
                      )),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 340,
              child: Text(
                'あなたのアカウントとコンテンツは完全に削除されます。30日以内にアカウントを復活させれば、削除のリクエストをキャンセルすることができます。',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
