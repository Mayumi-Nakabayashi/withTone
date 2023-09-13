import 'package:flutter/material.dart';
import 'package:withtone/views/pages/article/article_body.dart';
import 'package:withtone/views/pages/article/bottom_gradation_widget.dart';
import 'package:withtone/views/pages/article/contributor_info.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key});

  static const String path = '/article';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  surfaceTintColor: Colors.transparent,
                  expandedHeight: 280.0, // アプリバーの高さ
                  flexibleSpace: FlexibleSpaceBar(
                    background: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 150.0,
                                right: 30,
                                left: 30,
                                bottom: 30,
                              ),
                              child: Text(
                                articleTitel,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContributorInfo(
                                    name: '河村理香子',
                                    date: '2m ago',
                                    imageUrl:
                                        'https://thumb.photo-ac.com/4c/4c903a6ccab7d95e9e051cc7ee2de98a_t.jpeg',
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.send,
                                          color: Color(0xffFACF39),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.bookmark_border,
                                          color: Color(0xffFACF39),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: ArticleSliverHeaderDelegate(
                    imageUrl:
                        'https://thumb.photo-ac.com/4c/4c903a6ccab7d95e9e051cc7ee2de98a_t.jpeg',
                  ),
                  pinned: true, //ここをfalseにするとスクロールしたときに画像の部分も画面外にいく
                ),
              ];
            },
            body: ArticleBody(
                articleHeading: articleHeading, articleContent: articleContent),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 37,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
          )),
          const BottomGradationWidget()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xffFACF39),
        onPressed: () {},
        label: Row(
          children: [
            const Icon(
              Icons.thumb_up_alt,
              color: Color(0xffFFFFFF),
            ),
            const SizedBox(width: 10),
            Text(
              goodCount,
              style: const TextStyle(
                color: Color(0xffFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String imageUrl;

  ArticleSliverHeaderDelegate({
    required this.imageUrl,
  });

  @override
  double get minExtent => 200;
  @override
  double get maxExtent => 200;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}

String articleTitel = 'ビブラートで挫折しないための練習';
String articleHeading = 'A man’s sexuality is never your mind responsibility.';
String articleContent =
    'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.';
String goodCount = '2.1k';
