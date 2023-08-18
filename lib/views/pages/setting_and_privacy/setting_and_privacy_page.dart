import 'package:flutter/material.dart';
import 'package:withtone/views/pages/edit_profile/edit_profire_page.dart';

class SettingAndPrivacyPage extends StatefulWidget {
  const SettingAndPrivacyPage({super.key});

  @override
  State<SettingAndPrivacyPage> createState() => _SettingAndPrivacyPageState();
}

class _SettingAndPrivacyPageState extends State<SettingAndPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('設定とプライバシー'),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(height: 1, color: Colors.black38))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('アカウント', textAlign: TextAlign.start),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('アカウント'),
                  leading: const Icon(Icons.person_outline),
                  trailing: const Icon(Icons.chevron_right_sharp),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EditProfilePage();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('プライバシー'),
                  leading: const Icon(Icons.lock_outline),
                  trailing: const Icon(Icons.chevron_right_sharp),
                  onTap: () {
                    print('pon');
                  },
                ),
                PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: Container(
                      height: 1, //高さ
                      color: Colors.black38, //色
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('コンテンツ', textAlign: TextAlign.start),
                    ),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 10,
                  title: const Text('通知'),
                  leading: const Icon(Icons.notifications_none_outlined),
                  trailing: const Icon(Icons.chevron_right_sharp),
                  onTap: () {
                    print('pon');
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
