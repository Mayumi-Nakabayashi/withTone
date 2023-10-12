import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/pages/password_reissue_confirm/password_reissue_confirm_page.dart';

/// パスワード再発行依頼を送信するページ
class PasswordReissuePage extends StatefulWidget {
  const PasswordReissuePage({super.key});

  static const String path = '/password_reissue';

  @override
  State<PasswordReissuePage> createState() => _PasswordReissuePageState();
}

class _PasswordReissuePageState extends State<PasswordReissuePage> {
  TextEditingController mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'パスワードをお忘れですか？',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(height: 40), // 適当な余白
              const SizedBox(
                width: double.infinity,
                child: Text(
                  '登録時のメールアドレスを入力してください。再設定用のメールを送信します。',
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 40), // 適当な余白
              TextFormField(
                controller: mailController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "メールアドレスを入力してください",
                ),
                focusNode: FocusNode(),
                maxLength: 40,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (inputText) {
                  // TODO(ケンティー): 各種バリデーションはちゃんと考えて定義する. 共通化して他の箇所でも利用したい.
                  if (inputText == null || inputText == '') {
                    return '入力してください';
                  } else if (inputText.contains(' ')) {
                    return 'スペースが含まれています';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40), // 適当な余白
              PrimaryButton(
                  label: '送信する',
                  onPressed: () {
                    final auth = FirebaseAuth.instance;
                    auth.sendPasswordResetEmail(email: mailController.text);
                    Navigator.pushNamed(
                      context,
                      PasswordReissueConfirmPage.path,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
