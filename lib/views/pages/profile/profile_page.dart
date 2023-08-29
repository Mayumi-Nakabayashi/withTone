import 'package:flutter/material.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/pages/edit_profile/edit_profile_page.dart';
import 'package:withtone/views/pages/profile/counter.dart';
import 'package:withtone/views/pages/profile/item_view.dart';
import 'package:withtone/views/pages/profile/profile_buttom.dart';
import 'package:withtone/views/pages/setting/setting_page.dart';

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
      body: DefaultTabController(
        length: 2, // タブの数
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: [
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, SettingsPage.path),
                    icon: const Icon(Icons.more_horiz),
                  )
                ],
                expandedHeight: 380.0, // アプリバーの高さ
                pinned: true, // スクロール時にアプリバーを固定
                flexibleSpace: FlexibleSpaceBar(
                  background: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Row(
                              children: [
                                Expanded(flex: 1, child: SizedBox.shrink()),
                                Expanded(
                                  flex: 1,
                                  child: CircleProfileIcon(
                                      label: '@jacob_w',
                                      imageUrl:
                                          'https://pbs.twimg.com/profile_images/1410912969085444097/0g6BdWsP_400x400.jpg',
                                      isIcon: false,
                                      width: 125,
                                      height: 125,
                                      textSzie: 18),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate,
                                        color: Colors.yellow,
                                        size: 30,
                                      ),
                                      Text('4.8')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Counter(count: 14, label: 'フォロー'),
                                Counter(count: 38, label: 'フォロワー'),
                                Counter(count: 91, label: 'いいね')
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ProfileButtom(
                                  label: 'プロフィールを編集',
                                  onPressed: () => Navigator.pushNamed(
                                      context, EditProfilePage.path),
                                ),
                                ProfileButtom(
                                  label: '直接相談する',
                                  onPressed: () {},
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Text(
                                'ギターは長年やってますが、キーボードも弾けるようになりたいです！バイオリンは、アマチュアですがご相談にのれます！ #ギター #ピアノ #ポップス #dtm #初心者',
                                style: TextStyle(
                                    color: Color(0xFF8F8F8F), fontSize: 12),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    indicatorColor: Color(0xFFFFB921),
                    labelColor: Color(0xff86878B),
                    unselectedLabelColor: Color(0xff86878B),
                    tabs: [
                      Tab(
                        icon: Icon(Icons.photo_size_select_actual_rounded,
                            size: 30),
                      ),
                      Tab(
                        icon: Icon(Icons.favorite_border, size: 30),
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ItemView(itemList: imageList),
              ItemView(itemList: imageList)
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

//フリー素材画像
final imageList = [
  'https://thumb.photo-ac.com/4c/4c903a6ccab7d95e9e051cc7ee2de98a_t.jpeg',
  'https://thumb.photo-ac.com/62/625530fdece22d5265e21b86bb816f18_t.jpeg',
  'https://thumb.photo-ac.com/3b/3b3a9fa8bde4c77dd0f88a7dfbba612d_t.jpeg',
  'https://thumb.photo-ac.com/91/91f5edfc8dca2bfa7db3c0c424830b16_t.jpeg',
  'https://thumb.photo-ac.com/50/50a08677dfc4912c846932178b624d94_t.jpeg',
  'https://thumb.photo-ac.com/77/77bc0ec50dcd2f358046ca87fbffbc70_t.jpeg',
  'https://thumb.photo-ac.com/11/11054e3def88133b6b833eb73f6dc189_t.jpeg',
  'https://thumb.photo-ac.com/1d/1d63fdcd8da4ae770f0d0b0916168d44_t.jpeg',
  'https://thumb.photo-ac.com/5d/5dc77449c29de193effe7959997c2fc9_t.jpeg',
  'https://thumb.photo-ac.com/22/22fa5e2a507e43532a9ce8d562a7b4de_t.jpeg',
  'https://thumb.photo-ac.com/4c/4c903a6ccab7d95e9e051cc7ee2de98a_t.jpeg',
  'https://thumb.photo-ac.com/62/625530fdece22d5265e21b86bb816f18_t.jpeg',
  'https://thumb.photo-ac.com/3b/3b3a9fa8bde4c77dd0f88a7dfbba612d_t.jpeg',
  'https://thumb.photo-ac.com/91/91f5edfc8dca2bfa7db3c0c424830b16_t.jpeg',
  'https://thumb.photo-ac.com/50/50a08677dfc4912c846932178b624d94_t.jpeg',
  'https://thumb.photo-ac.com/77/77bc0ec50dcd2f358046ca87fbffbc70_t.jpeg',
  'https://thumb.photo-ac.com/11/11054e3def88133b6b833eb73f6dc189_t.jpeg',
  'https://thumb.photo-ac.com/1d/1d63fdcd8da4ae770f0d0b0916168d44_t.jpeg',
  'https://thumb.photo-ac.com/5d/5dc77449c29de193effe7959997c2fc9_t.jpeg',
  'https://thumb.photo-ac.com/22/22fa5e2a507e43532a9ce8d562a7b4de_t.jpeg',
];
