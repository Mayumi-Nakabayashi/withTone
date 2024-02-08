import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/providers/user/login_user.dart';
import 'package:withtone/views/components/admob/ad_banner.dart';
import 'package:withtone/views/components/icon/circle_profile_icon.dart';
import 'package:withtone/views/pages/article/article_page.dart';
import 'package:withtone/views/pages/content/article_card.dart';
import 'package:withtone/views/pages/content/content_appbar.dart';
import 'package:withtone/views/pages/content/learning_card.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';

/// 学ぶ
class ContentPage extends ConsumerStatefulWidget {
  const ContentPage({super.key});

  static const String path = '/content';

  @override
  ConsumerState<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends ConsumerState<ContentPage> {
  bool _visible = true;

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

    final double floatingButtonWidth = MediaQuery.of(context).size.width * 0.75;
    const double floatingButtonHeight = 46;

    /// TabBar ラベル
    const tabs = <Widget>[
      Tab(text: '新着メニュー'),
      Tab(text: '記事'),
      Tab(text: 'イベント'),
    ];

    Widget tabBar = const TabBar(
      tabs: tabs,
      labelPadding: EdgeInsets.all(0),
      dividerColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      indicatorColor: Colors.transparent,
      labelColor: Color(0xffFFB921),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        shadows: [
          Shadow(
            color: Colors.grey,
            offset: Offset(0, 4.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      unselectedLabelColor: Color(0xff5E6272),
      unselectedLabelStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );

    Widget listViewWidget(String category) {
      return ListView(
        scrollDirection: Axis.horizontal,
        children: articleList[category]!
            .map(
              (item) => ArticleCard(
                width: MediaQuery.of(context).size.width * 0.4,
                imagePath: item['imagePath'],
                title: item['title'],
                timestamp: item['timestamp'],
                onPressed: () => Navigator.pushNamed(context, ArticlePage.path),
              ),
            )
            .toList(),
      );
    }

    /// tab コンテンツ
    Widget tabBarWidget() {
      return DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: tabBar,
            ),
            SizedBox(
              height: 200,
              child: TabBarView(
                children: [
                  SizedBox(
                    child: listViewWidget('lesson'),
                  ),
                  SizedBox(
                    child: listViewWidget('article'),
                  ),
                  SizedBox(
                    child: listViewWidget('event'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    /// 下部 ListView コンテンツ
    final List<LeaningCard> leaningItems = learningList
        .map(
          (item) => LeaningCard(
            thumbnail: item['thumbnail'],
            title: item['title'],
            timestamp: item['timestamp'],
            subtitle: item['subtitle'],
            tags: item['tags'],
          ),
        )
        .toList();

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const AdBanner(), //バナー広告
              ContentAppBar(
                title: const Text(
                  'チャレンジ',
                  style: TextStyle(
                    height: 24 / 18,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: userIcon,
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              tabBarWidget(),
              const Padding(
                padding: EdgeInsets.only(top: 26.0),
                child: Text(
                  '似たことで困っている質問を見てみよう',
                  style: TextStyle(
                    height: 24 / 18,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    /// スクロール中はボタンを非表示にする
                    setState(() {
                      _visible = false;
                    });

                    /// スクロールが止まった時にボタンを表示する
                    ScrollDirection scrollDirection = ScrollDirection.idle;
                    if (notification is UserScrollNotification) {
                      if (notification.direction == scrollDirection) {
                        setState(() {
                          _visible = true;
                        });
                      }
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: leaningItems.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < leaningItems.length) {
                        return leaningItems[index];
                      } else {
                        return const SizedBox(
                            height: floatingButtonHeight + 20); // スペースの高さを調整
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _visible
            ? SizedBox(
                width: floatingButtonWidth,
                height: floatingButtonHeight,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    // TODO: 遷移先の実装
                  },
                  label: const Text(
                    '今すぐ質問する',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  backgroundColor: const Color(0xFF005792),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              )
            : Container());
  }
}

final Map<String, List<Map<String, dynamic>>> articleList = {
  'lesson': [
    {
      'imagePath': 'assets/logo/mainlogo.png',
      'title': 'バイオリンのハイポジションに挑戦（メニュー）',
      'category': 'lesson',
      'timestamp': 'January, 19 2021',
    },
    {
      'imagePath': 'assets/logo/mainlogo.png',
      'title': 'バイオリンのハイポジションに挑戦（メニュー）',
      'category': 'lesson',
      'timestamp': 'January, 19 2021',
    },
    {
      'imagePath': 'assets/logo/mainlogo.png',
      'title': 'バイオリンのハイポジションに挑戦（メニュー）',
      'category': 'lesson',
      'timestamp': 'January, 19 2021',
    },
    {
      'imagePath': 'assets/logo/mainlogo.png',
      'title': 'バイオリンのハイポジションに挑戦（メニュー）',
      'category': 'lesson',
      'timestamp': 'January, 19 2021',
    },
    {
      'imagePath': 'assets/logo/mainlogo.png',
      'title': 'バイオリンのハイポジションに挑戦（メニュー）',
      'category': 'lesson',
      'timestamp': 'January, 19 2021',
    },
  ],
  'article': [
    {
      'imagePath': 'assets/logo/appmain_color.png',
      'title': 'ビブラートで挫折しないための練習(記事)',
      'category': 'article',
      'timestamp': 'October, 20 2021',
    },
    {
      'imagePath': 'assets/logo/appmain_color.png',
      'title': 'ビブラートで挫折しないための練習(記事)',
      'category': 'article',
      'timestamp': 'October, 20 2021',
    },
    {
      'imagePath': 'assets/logo/appmain_color.png',
      'title': 'ビブラートで挫折しないための練習(記事)',
      'category': 'article',
      'timestamp': 'October, 20 2021',
    },
    {
      'imagePath': 'assets/logo/appmain_color.png',
      'title': 'ビブラートで挫折しないための練習(記事)',
      'category': 'article',
      'timestamp': 'October, 20 2021',
    },
    {
      'imagePath': 'assets/logo/appmain_color.png',
      'title': 'ビブラートで挫折しないための練習（記事）',
      'category': 'article',
      'timestamp': 'October, 20 2021',
    },
  ],
  'event': [
    {
      'imagePath': 'assets/logo/app_nobackground.png',
      'title': 'ビブラートイベント',
      'category': 'event',
      'timestamp': 'October, 20 2021',
    },
  ],
};

final List<Map<String, dynamic>> learningList = [
  {
    'thumbnail': 'assets/logo/mainlogo.png',
    'title': 'スタッカートのFBください！',
    'timestamp': 'January, 19 2021',
    'subtitle': '質問と回答をみる',
    'tags': ['violin', 'tone', 'piano', 'test'],
  },
  {
    'thumbnail': 'assets/logo/app_nobackground.png',
    'title': 'ビブラートで挫折しないための練習',
    'timestamp': 'October, 20 2021',
    'subtitle': '質問と回答をみる',
    'tags': [],
  },
  {
    'thumbnail': 'assets/logo/appmain_color.png',
    'title': 'バイオリンのハイポジションに挑戦',
    'timestamp': 'January, 19 2021',
    'subtitle': '質問と回答をみる',
    'tags': ['violin', 'dtm'],
  },
  {
    'thumbnail': 'assets/logo/appmain_color.png',
    'title': 'ビブラートで挫折しないための練習',
    'timestamp': 'October, 20 2021',
    'subtitle': '質問と回答をみる',
    'tags': ['violin'],
  },
  {
    'thumbnail': 'assets/logo/appmain_color.png',
    'title': 'ビブラートで挫折しないための練習',
    'timestamp': 'October, 20 2021',
    'subtitle': '質問と回答をみる',
    'tags': [],
  },
  {
    'thumbnail': 'assets/logo/appmain_color.png',
    'title': 'ビブラートで挫折しないための練習',
    'timestamp': 'October, 20 2021',
    'subtitle': '質問と回答をみる',
    'tags': [],
  },
  {
    'thumbnail': 'assets/logo/appmain_color.png',
    'title': 'ビブラートで挫折しないための練習',
    'timestamp': 'October, 20 2021',
    'subtitle': '質問と回答をみる',
    'tags': [],
  },
  {
    'thumbnail': 'assets/logo/appmain_color.png',
    'title': 'ビブラートで挫折しないための練習',
    'timestamp': 'October, 20 2021',
    'subtitle': '質問と回答をみる',
    'tags': [],
  },
];
