import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/components/text_button_zero_padding.dart';
import 'package:withtone/views/pages/home_page.dart';
import 'package:withtone/views/pages/password_reissue/password_reissue_page.dart';

/// メールでログインするページ
class LoginMailPage extends StatefulWidget {
  const LoginMailPage({super.key});

  static const String path = '/login_mail';

  @override
  State<LoginMailPage> createState() => _LoginMailPageState();
}

class _LoginMailPageState extends State<LoginMailPage> {
  /// パスワードを表示するかどうか
  bool _showPassword = false;

  /// パスワードの表示を切り替える
  _toggleShowPassword() {
    setState(() => _showPassword = !_showPassword);
  }

  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'メールアドレス',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
              ),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
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
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'パスワード',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              TextFormField(
                controller: passwordcontroller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "パスワードを入力してください",
                  suffixIcon: TextButton(
                    onPressed: _toggleShowPassword,
                    child: const Text('Show'),
                  ),
                ),
                obscureText: _showPassword,
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
              Container(
                alignment: Alignment.centerRight,
                child: TextButtonZeroPadding(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    PasswordReissuePage.path,
                  ),
                  child: const Text('パスワードをお忘れですか?'),
                ),
              ),
              const SizedBox(height: 40), // 適当な余白
              PrimaryButton(
                  label: 'ログイン',
                  onPressed: () async {
                    final email = emailController.text;
                    final password = passwordcontroller.text;
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (mounted) {
                      await Navigator.pushNamed(context, HomePage.path);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
