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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String errorText = '';

  /// 新規ユーザー仮登録実行
  Future<void> _signup({
    required String email,
    required String password,
    required VoidCallback successCallback,
  }) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // メール認証を送信
      await result.user?.sendEmailVerification();
      successCallback();
    } catch (e) {
      setState(() {
        errorText = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              errorText.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.all(40),
                      width: double.infinity,
                      child: Text(
                        errorText,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Color(0xffFF0000)),
                      ),
                    )
                  : const SizedBox(height: 100),
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
                controller: passwordController,
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
                  await _signup(
                    email: emailController.text,
                    password: passwordController.text,
                    successCallback: () {
                      if (mounted) {
                        ///引数で渡したいため,routesで画面遷移させていない
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmailSendCheck(
                              email: emailController.text,
                              password: passwordController.text,
                              from: 1,
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
