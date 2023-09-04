import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/pages/signup_mail/emaill_send_check.dart';

/// メールで登録するページ
class SignupMailPage extends StatefulWidget {
  const SignupMailPage({super.key});

  static const String path = '/signup_mail';

  @override
  State<SignupMailPage> createState() => _SignupMailPageState();
}

class _SignupMailPageState extends State<SignupMailPage> {
  /// パスワードを表示するかどうか
  bool _showPassword = false;

  /// パスワードの表示を切り替える
  _toggleShowPassword() {
    setState(() => _showPassword = !_showPassword);
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordcontroller = TextEditingController();
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
              const SizedBox(height: 40), // 適当な余白
              PrimaryButton(
                label: '登録',
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordcontroller.text;
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (mounted) {
                    await Navigator.pushNamed(context, EmailSendCheck.path);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
