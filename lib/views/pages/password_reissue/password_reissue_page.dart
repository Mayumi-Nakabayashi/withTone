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
            children: [
              const SizedBox(height: 20), // 適当な余白
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'パスワードをお忘れですか？',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(height: 20), // 適当な余白
              const SizedBox(
                width: double.infinity,
                child: Text(
                  '登録時のメールアドレスを入力してください。',
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 40), // 適当な余白

              const SizedBox(
                width: double.infinity,
                child: Text(
                  'メールアドレス',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              TextFormField(
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
              const SizedBox(height: 20), // 適当な余白

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(double.maxFinite),
                      backgroundColor: const Color(0xFFF73F96),
                      foregroundColor: const Color(0xffffffff),
                      surfaceTintColor: const Color(0xFFF73F96),
                      elevation: 0,
                    ),
                    onPressed: () => Navigator.pushNamed(
                          context,
                          PasswordReissueConfirmPage.path,
                        ),
                    child: const Text('送信する')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
