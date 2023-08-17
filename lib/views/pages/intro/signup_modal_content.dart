import 'package:flutter/material.dart';
import 'package:withtone/views/pages/intro/intro_modal_list_tile.dart';
import 'package:withtone/views/pages/signup_mail/signup_mail.dart';

/// ログインページのモーダルで、新規登録を選択中に表示されるモーダル内のコンテンツ
class SignupModalContent extends StatefulWidget {
  const SignupModalContent({super.key});

  @override
  State<SignupModalContent> createState() => _SignupModalContentState();
}

class _SignupModalContentState extends State<SignupModalContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Welcome',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/google.png',
          label: 'Google で登録する',
          onTap: () {},
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/apple.png',
          label: 'Apple で登録する',
          onTap: () {},
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/facebook.png',
          label: 'facebook で登録する',
          onTap: () {},
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/twitter.png',
          label: 'Twitter で登録する',
          onTap: () {},
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/mail.png',
          label: 'メールアドレス で登録する',
          onTap: () => Navigator.pushNamed(context, SignupMailPage.path),
        ),
      ],
    );
  }
}
