import 'package:flutter/material.dart';
import 'package:withtone/views/pages/edit_profile/edit_profile_page.dart';
import 'package:withtone/views/pages/setting_and_privacy/setting_and_privacy_page.dart';

/// プロフィール
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String path = '/content';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              SettingAndPrivacyPage.path,
            ),
            icon: const Icon(Icons.more_horiz),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  EditProfilePage.path,
                ),
                child: const Text('プロフィールを編集'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
