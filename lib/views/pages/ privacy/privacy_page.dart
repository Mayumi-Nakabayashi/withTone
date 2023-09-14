import 'package:flutter/material.dart';
import 'package:withtone/views/components/border_widget.dart';
import 'package:withtone/views/pages/%20privacy/gradation_switch.dart';

///プライバシー関係の設定ページ(アカウント非公開など)
class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  static const String path = '/privacy';

  @override
  State<PrivacyPage> createState() => _PrivecyPageState();
}

class _PrivecyPageState extends State<PrivacyPage> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('プライバシー'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: Colors.black38))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '非公開アカウント',
                          style: TextStyle(fontSize: 16),
                        ),
                        GradientSwitch(
                          value: isOpen,
                          onChanged: (bool value) {
                            setState(() {
                              isOpen = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 3, right: 3, top: 10),
                      child: Text(
                        'アカウントが非公開になっている場合、あなたが承認したユーザーのみがあなたをフォローしたり、動画を視聴したりすることができます。既存のフォロワーに影響はありません。',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: BorderWidjet(),
            )
          ],
        ),
      ),
    );
  }
}
