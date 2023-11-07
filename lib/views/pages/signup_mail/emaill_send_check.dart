// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/pages/edit_profile/register_user_page.dart';

class EmailSendCheck extends StatefulWidget {
  // 呼び出し元Widgetから受け取った後、変更をしないためfinalを宣言。
  final String email;
  final String password;
  final int from;
  //1 → アカウント作成画面から    2 → ログイン画面から

  const EmailSendCheck({
    Key? key,
    required this.email,
    required this.password,
    required this.from,
  }) : super(key: key);

  static const String path = '/email_send_check';

  @override
  EmailSendCheckState createState() => EmailSendCheckState();
}

class EmailSendCheckState extends State<EmailSendCheck> {
  final _auth = FirebaseAuth.instance;
  UserCredential? _result;
  String? _noCheckText;
  String? _sentEmailText;
  int _btnClickNum = 0;

  @override
  void initState() {
    timerReading();
    super.initState();
  }

  void timerReading() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      await _auth.currentUser?.reload();
      final emailVerified = _auth.currentUser?.emailVerified ?? false;
      if (!emailVerified) {
        return;
      }
      // emailVerifiedがtrueに変更されたタイミングでタイマーを停止
      timer.cancel();
      if (mounted) {
        await Navigator.pushNamed(context, ResisterUserPage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 前画面から遷移後の初期表示内容
    if (_btnClickNum == 0) {
      if (widget.from == 1) {
        // アカウント作成画面から遷移した時
        _noCheckText = '';
        _sentEmailText = '${widget.email}\nに確認メールを送信しました。';
      } else {
        _noCheckText = 'まだメール確認が完了していません。\n確認メール内のリンクをクリックしてください。';
        _sentEmailText = '';
      }
    }

    return Scaffold(
      // メイン画面
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 確認メール未完了時のメッセージ
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              child: Text(
                _noCheckText!,
                style: const TextStyle(color: Colors.red),
              ),
            ),

            // 確認メール送信時のメッセージ
            Text(_sentEmailText!),
            const SizedBox(
              height: 20,
            ),

            PrimaryButton(
              label: '確認メールを再送信',
              onPressed: () async {
                _result = await _auth.signInWithEmailAndPassword(
                  email: widget.email,
                  password: widget.password,
                );

                _result?.user!.sendEmailVerification();
                setState(() {
                  _btnClickNum++;
                  _sentEmailText = '${widget.email}\nに確認メールを送信しました。';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
