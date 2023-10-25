import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:withtone/views/components/border_widget.dart';
import 'package:withtone/views/components/settings_tile.dart';

///アカウントの設定をするページ(パスワード、ログアウトとか)
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  static const String path = '/acocunt';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('アカウント'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: Colors.black38))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsTile(title: 'アカウント情報', onPressed: () {}),
            SettingsTile(title: 'パスワード', onPressed: () {}),
            SettingsTile(
                title: 'ログアウト',
                onPressed: () {
                  final auth = FirebaseAuth.instance;
                  GoogleSignIn().signOut();
                  auth.signOut();
                }),
            SettingsTile(title: 'アカウントの削除', onPressed: () {}),
            const BorderWidget()
          ],
        ),
      ),
    );
  }
}
