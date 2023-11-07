import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:withtone/splash_page.dart';
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
  Function logoutAndTransitionSplashPage = (BuildContext context) {
    // ログアウト
    final auth = FirebaseAuth.instance;
    GoogleSignIn().signOut();
    auth.signOut();
    // ログイン前の画面に戻る
    Navigator.of(context).pushNamedAndRemoveUntil(
      SplashPage.path,
      (_) => false,
    );
  };

  ///BottomSheetを表示
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 240,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    '本当にログアウトしますか',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const BorderWidget(color: Color(0xffD0D1D3)),
                ListTile(
                  title: const Text('ログアウト', textAlign: TextAlign.center),
                  onTap: () => logoutAndTransitionSplashPage(context),
                ),
                const BorderWidget(color: Color(0xffD0D1D3)),
                ListTile(
                  title: const Text('戻る', textAlign: TextAlign.center),
                  onTap: () => Navigator.pop(context),
                ),
                const BorderWidget(color: Color(0xffD0D1D3)),
              ],
            ),
          ),
        );
      },
    );
  }

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
              onPressed: () => _showBottomSheet(context),
            ),
            SettingsTile(title: 'アカウントの削除', onPressed: () {}),
            const BorderWidget()
          ],
        ),
      ),
    );
  }
}
