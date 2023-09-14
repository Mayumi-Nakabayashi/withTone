import 'package:flutter/material.dart';
import 'package:withtone/views/components/circle_icon_buttom.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/pages/professional/background_color.dart';
import 'package:withtone/views/pages/professional/professional_tile.dart';

///プロフェッショナルページ
class ProfessionalPage extends StatefulWidget {
  const ProfessionalPage({super.key});

  static const String path = '/professional';

  @override
  State<ProfessionalPage> createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColor(), //背景色ウィジェット

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '気になる人に\n直接相談しよう！',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          CircleIconButton(
                            icon: Icons.search,
                            onTap: () {},
                          ),
                          const SizedBox(width: 25),
                          CircleProfileIcon(
                            imageUrl:
                                'https://thumb.photo-ac.com/4c/4c903a6ccab7d95e9e051cc7ee2de98a_t.jpeg',
                            isIcon: false,
                            size: 44,
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                        itemCount: test.length,
                        itemBuilder: (context, index) {
                          final tests = test[index];
                          return ProfessionalTile(
                              imageUrl: tests['imageUrl'],
                              name: tests['name'],
                              introduction: tests['introduction'],
                              tags: tests['tags'],
                              score: tests['score']);
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // ボタンが押されたときの処理
        },
        label: const Text(
          '今すぐティップスを紹介する',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: const Color(0xFF005792),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

final List<Map> test = [
  {
    'name': '木村 なつみ',
    'imageUrl':
        'https://thumb.photo-ac.com/3b/3b3a9fa8bde4c77dd0f88a7dfbba612d_t.jpeg',
    'introduction': 'ピアノ歴10年です！',
    'tags': '#piano #pops',
    'score': '4.5'
  },
  {
    'name': '斎藤 理恵',
    'imageUrl':
        'https://thumb.photo-ac.com/91/91f5edfc8dca2bfa7db3c0c424830b16_t.jpeg',
    'introduction': '音大でドラムの勉強をしました',
    'tags': '#dtm #drum',
    'score': '4.5'
  },
  {
    'name': '河村理香子',
    'imageUrl':
        'https://thumb.photo-ac.com/62/625530fdece22d5265e21b86bb816f18_t.jpeg',
    'introduction': 'ほぼ独学でバイオリンを学びました！',
    'tags': '#violin #pops #classic',
    'score': '4.5'
  },
  {
    'name': '石川 啄也',
    'imageUrl':
        'https://pbs.twimg.com/profile_images/1410912969085444097/0g6BdWsP_400x400.jpg',
    'introduction': 'Fulutter歴1年です!',
    'tags': '#Flutter #Dart',
    'score': '4.5'
  },
];
