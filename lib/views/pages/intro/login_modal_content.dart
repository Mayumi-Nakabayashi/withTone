import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:withtone/views/pages/intro/intro_modal_list_tile.dart';
import 'package:withtone/views/pages/login_mail/login_mail_page.dart';

/// ログインページのモーダルで、ログインを選択中に表示されるモーダル内のコンテンツ
class LoginModalContent extends StatefulWidget {
  const LoginModalContent({super.key});

  @override
  State<LoginModalContent> createState() => _LoginModalContentState();
}

class _LoginModalContentState extends State<LoginModalContent> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Welcome back',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/google.png',
          label: 'Google で続ける',
          onTap: () async {
            final googleUser = await GoogleSignIn().signIn();
            final googleAuth = await googleUser!.authentication;
            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
            try {
              final result = await auth.signInWithCredential(credential);
              final user = result.user;
            } catch (e) {
              print(e);
            }
          },
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/apple.png',
          label: 'Apple で続ける',
          onTap: () async {
            final appleIdCredential =
                await SignInWithApple.getAppleIDCredential(
              scopes: [
                AppleIDAuthorizationScopes.email,
                AppleIDAuthorizationScopes.fullName,
              ],
            );
            final oAuthProvider = OAuthProvider('apple.com');
            final credential = oAuthProvider.credential(
              idToken: appleIdCredential.identityToken,
              accessToken: appleIdCredential.authorizationCode,
            );
            try {
              final result = await auth.signInWithCredential(credential);
              final user = result.user;
            } catch (e) {}
          },
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/facebook.png',
          label: 'facebook で続ける',
          onTap: () {},
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/twitter.png',
          label: 'Twitter で続ける',
          onTap: () {},
        ),
        const SizedBox(height: 20), // 適当な余白
        IntroModalListTile(
          leadingAssetPath: 'assets/logo/mail.png',
          label: 'メールアドレス で続ける',
          onTap: () => Navigator.pushNamed(context, LoginMailPage.path),
        ),
      ],
    );
  }
}
