import 'package:flutter/material.dart';
import 'package:withtone/views/pages/password_reissue_confirm/password_reissue_confirm_page.dart';

/// パスワード再発行依頼を送信するページ
class PasswordReissuePage extends StatefulWidget {
  const PasswordReissuePage({super.key});

  static const String path = '/password_reissue';

  @override
  State<PasswordReissuePage> createState() => _PasswordReissuePageState();
}

class _PasswordReissuePageState extends State<PasswordReissuePage> {
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
              const Text('パスワードをお忘れですか？'),
              const Text('登録時のメールアドレスを入力してください。'),
              TextFormField(
                restorationId: 'life_story_field',
                focusNode: FocusNode(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "メールアドレスを入力してください",
                  labelText: "メールアドレス",
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                          context,
                          PasswordReissueConfirmPage.path,
                        ),
                    child: const Text('送信')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
