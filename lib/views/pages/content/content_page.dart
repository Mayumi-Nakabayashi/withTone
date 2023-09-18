import 'package:flutter/material.dart';
import 'package:withtone/views/components/admob/ad_banner.dart';
import 'package:withtone/views/pages/content/article_card.dart';
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      //appbarの上にバナーを設置するためのStack
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 50, //バナーが入る幅を確保
              surfaceTintColor: Colors.transparent,
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
                // TODO: 検索機能み実装（α版には含まないためコメントアウト）
                // IconButton(
                //   icon: const Icon(
                //     Icons.search,
                //     size: 44,
                //   ),
                //   onPressed: () {},
                // ),
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
            body: Column(
              children: [
                const SizedBox(
                  height: 26,
                ),
                // TODO: タブ切り替えの実装
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('新着メニュー'),
                    Text('記事'),
                    Text('イベント'),
                  ],
                ),
                SizedBox(
                  height: 195,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: articleList
                        .map(
                          (item) => ArticleCard(
                            width: MediaQuery.of(context).size.width * 0.4,
                            imagePath: item['imagePath'],
                            title: item['title'],
                            timestamp: item['timestamp'],
                          ),
                        )
                        .toList(),
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
                  child: ListView(
                    children: learningList
                        .map(
                          (item) => LeaningCard(
                            thumbnail: item['thumbnail'],
                            title: item['title'],
                            timestamp: item['timestamp'],
                            subtitle: item['subtitle'],
                            tags: item['tags'],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SafeArea(child: AdBanner()), //バナー広告
      ],
    );
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
];
