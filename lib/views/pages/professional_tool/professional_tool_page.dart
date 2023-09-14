import 'package:flutter/material.dart';
import 'package:withtone/views/components/settings_tile.dart';
import 'package:withtone/views/pages/setting/settings_line_title.dart';

/// アカウントの設定をするページ(パスワード、ログアウトとか)
class ProfessionalToolPage extends StatefulWidget {
  const ProfessionalToolPage({super.key});

  static const String path = '/professional_tool';

  @override
  State<ProfessionalToolPage> createState() => _ProfessionalToolPageState();
}

class _ProfessionalToolPageState extends State<ProfessionalToolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフェッショナルツール'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SettingsTitle(title: '一般'),
            SettingsTile(
              title: 'インサイト',
              onPressed: () {},
              leadingIcon: const Icon(Icons.auto_graph_sharp),
              isNewArrival: true,
            ),
            SettingsTile(
              title: 'プロフェッショナルポータル',
              onPressed: () {},
              leadingIcon: const Icon(Icons.star_border_rounded),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SettingsTitle(title: 'メモ（特化型コンテンツ)'),
            ),
            SettingsTile(
              title: '通知',
              onPressed: () {},
              leadingIcon: const Icon(Icons.notifications_none),
            ),
          ],
        ),
      ),
    );
  }
}
