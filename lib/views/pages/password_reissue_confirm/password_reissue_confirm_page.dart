import 'package:flutter/material.dart';
import 'package:withtone/views/pages/intro/intro_page.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                'メールを送信しました',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(height: 40), // 適当な余白
            const SizedBox(
              width: double.infinity,
              child: Text(
                'パスワード再設定用のメールを送信しました。メール内のリンクから新しいパスワードを設定してください。',
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 40), // 適当な余白

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
                        IntroPage.path,
                        arguments: IntroPageArguments(showModal: true),
                      ),
                  child: const Text('ログインページへ')),
            ),
          ],
        ),
      ),
    );
  }
}
