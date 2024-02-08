import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/providers/user/login_user.dart';
import 'package:withtone/views/components/admob/ad_banner.dart';
import 'package:withtone/views/components/icon/circle_icon_button.dart';
import 'package:withtone/views/components/icon/circle_profile_icon.dart';
import 'package:withtone/views/pages/professional/background_color.dart';
import 'package:withtone/views/pages/professional/professional_tile.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';

///プロフェッショナルページ
class ProfessionalPage extends ConsumerStatefulWidget {
  const ProfessionalPage({super.key});

  static const String path = '/professional';

  @override
  ConsumerState<ProfessionalPage> createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends ConsumerState<ProfessionalPage> {
  @override
  Widget build(BuildContext context) {
    // loginUser (AsyncValue<WithToneUser>) を取得
    final loginUser = ref.watch(loginUserProvider);

    // loginUser.userImage から Widget を生成
    final userIcon = switch (loginUser) {
      AsyncError() => const Icon(Icons.person),
      AsyncData(:final value) => CircleProfileIcon(
          size: 44,
          isIcon: false,
          imageUrl: value.userImage,
          onPressed: () => Navigator.pushNamed(context, ProfilePage.path),
        ),
      _ => const CircularProgressIndicator(),
    };

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColor(), //背景色ウィジェット

          SafeArea(
            child: Column(
              children: [
                const AdBanner(), //バナー広告
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 20, right: 20),
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
                          userIcon,
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
];
