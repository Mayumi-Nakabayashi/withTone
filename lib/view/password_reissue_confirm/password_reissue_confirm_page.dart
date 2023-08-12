import 'package:flutter/material.dart';
import 'package:withtone/view/login/login_page.dart';

/// パスワード再発送信後に表示するページ
class PasswordReissueConfirmPage extends StatefulWidget {
  const PasswordReissueConfirmPage({super.key});

  static const String path = '/password_reissue_confirm';

  @override
  State<PasswordReissueConfirmPage> createState() =>
      _PasswordReissueConfirmPageState();
}

class _PasswordReissueConfirmPageState
    extends State<PasswordReissueConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('メールを送信しました'),
              const Text('パスワードを再発行しました。'),
              const Text('メールを送信しましたのでご確認ください。'),
              const Text('10秒後にログインページに戻ります。'),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                          context,
                          LoginPage.path,
                        ),
                    child: const Text('ログインページへ')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
