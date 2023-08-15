import 'package:flutter/material.dart';
import 'package:withtone/views/components/text_button_zero_padding.dart';
import 'package:withtone/views/pages/password_reissue/password_reissue_page.dart';

/// ログインページのモーダルで、ログインを選択中に表示されるモーダル内のコンテンツ
class LoginModalContent extends StatefulWidget {
  const LoginModalContent({super.key});

  @override
  State<LoginModalContent> createState() => _LoginModalContentState();
}

class _LoginModalContentState extends State<LoginModalContent> {
  /// パスワードを表示するかどうか
  bool _showPassword = false;

  // パスワードの表示を切り替える
  _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(double.maxFinite),
                backgroundColor: const Color(0xff005792),
                foregroundColor: const Color(0xffffffff),
                surfaceTintColor: const Color(0xff005792),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text(
                'ログイン',
                style: TextStyle(
                  height: 60 / 18,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20), // 適当な余白
        Column(
          children: [
            const Text('パスワードをお忘れですか?'),
            TextButtonZeroPadding(
              onPressed: () => Navigator.pushNamed(
                context,
                PasswordReissuePage.path,
              ),
              child: const Text('Reset here'),
            ),
          ],
        ),
        const SizedBox(height: 20), // 適当な余白
        Column(
          children: [
            Text(
              'OR SIGN IN WITH',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Text('G'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Text('F'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Text('X'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
