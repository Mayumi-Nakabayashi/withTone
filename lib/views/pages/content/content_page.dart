import 'package:flutter/material.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';

/// 学ぶ
class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  static const String path = '/content';

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'チャレンジ',
          style: TextStyle(
            height: 24 / 18,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          // TODO: 検索機能み実装
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 44,
            ),
            onPressed: () {},
          ),
          IconButton(
            // FIXME: アイコン下手がきにしてます
            icon: const Icon(
              Icons.insert_emoticon_rounded,
              size: 44,
            ),
            onPressed: () => Navigator.pushNamed(context, ProfilePage.path),
          ),
        ],
      ),
    );
  }
}
