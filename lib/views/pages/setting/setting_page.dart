import 'package:flutter/material.dart';
import 'package:withtone/views/components/settings_tile.dart';
import 'package:withtone/views/pages/%20privacy/privacy_page.dart';
import 'package:withtone/views/pages/account/account_page.dart';
import 'package:withtone/views/pages/setting/settings_line_title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const String path = '/setting';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('設定とプライバシー'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                const SettingsTitle(title: 'アカウント'),
                SettingsTile(
                    onPressed:
                        // TODO: pushNamed のようなメソッドでモーダル遷移したい.
                        // routes で管理しているルーティングテーブルと重複していて,
                        // SSOT の原則に沿っていない.

                        () => Navigator.pushNamed(context, AccountPage.path),
                    leadingIcon: const Icon(Icons.person_outline),
                    title: 'アカウント'),
                SettingsTile(
                    onPressed: () =>
                        Navigator.pushNamed(context, PrivacyPage.path),
                    leadingIcon: const Icon(Icons.lock_outline),
                    title: 'プライバシー'),
                const SettingsTitle(title: 'コンテンツ'),
                SettingsTile(
                    onPressed: () {},
                    leadingIcon: const Icon(Icons.notifications_none_outlined),
                    title: '通知'),
              ],
            ),
          ),
        ));
  }
}
