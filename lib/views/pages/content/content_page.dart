import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:withtone/views/components/admob/ad_banner.dart';
import 'package:withtone/views/pages/article/article_page.dart';
import 'package:withtone/views/pages/content/article_card.dart';
import 'package:withtone/views/pages/content/content_appbar.dart';
import 'package:withtone/views/pages/content/learning_card.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';

/// 学ぶ
class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  static const String path = '/content';

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  bool _visible = true;

  /// タブ用ラベル
  final _tabs = <Widget>[
    const Tab(text: '新着メニュー'),
    const Tab(text: '記事'),
    const Tab(text: 'イベント'),
  ];

  @override
  Widget build(BuildContext context) {
    final double floatingButtonWidth = MediaQuery.of(context).size.width * 0.75;
    const double floatingButtonHeight = 46;

    final List<ArticleCard> articleItems = articleList
        .map(
          (item) => ArticleCard(
            width: MediaQuery.of(context).size.width * 0.4,
            imagePath: item['imagePath'],
            title: item['title'],
            timestamp: item['timestamp'],
            onPressed: () => Navigator.pushNamed(context, ArticlePage.path),
          ),
        )
        .toList();

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
                  IconButton(
                    // FIXME: アイコン下手がきにしてます
                    icon: const Icon(
                      Icons.insert_emoticon_rounded,
                      size: 44,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, ProfilePage.path),
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              DefaultTabController(
                length: _tabs.length,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TabBar(
                    tabs: _tabs,
                    labelPadding: const EdgeInsets.all(0),
                    dividerColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    indicatorColor: Colors.transparent,
                    labelColor: const Color(0xffFFB921),
                    labelStyle: const TextStyle(
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
                    unselectedLabelColor: const Color(0xff5E6272),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 195,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: articleItems,
                ),
              ),
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

final List<Map<String, dynamic>> articleList = [
  {
    'imagePath': 'assets/logo/mainlogo.png',
    'title': 'バイオリンのハイポジションに挑戦',
    'timestamp': 'January, 19 2021',
  },
  {
    'imagePath': 'assets/logo/app_nobackground.png',
    'title': 'ビブラートで挫折しないための練習',
    'timestamp': 'October, 20 2021',
  },
  {
    'imagePath': 'assets/logo/appmain_color.png',
    'title': 'バイオリンのハイポジションに挑戦',
    'timestamp': 'January, 19 2021',
  },
  {
    'imagePath': 'assets/logo/mainlogo.png',
    'title': 'ビブラートで挫折しないための練習',
    'timestamp': 'October, 20 2021',
  },
];

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
