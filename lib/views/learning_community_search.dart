import 'package:flutter/material.dart';

class LeaningCommunitySearch extends StatefulWidget {
  const LeaningCommunitySearch({super.key});

  static const String path = '/learning_community_search';

  @override
  State<LeaningCommunitySearch> createState() => _LeaningCommunitySearchState();
}

class SearchItem {
  final String label;
  SearchItem({required this.label});

  bool isSelected = false;
}

class _LeaningCommunitySearchState extends State<LeaningCommunitySearch> {
  List<SearchItem> searchItems = [
    SearchItem(label: '作曲'),
    SearchItem(label: '路上パフォーマンス'),
    SearchItem(label: 'ピアノ'),
    SearchItem(label: 'DTM'),
    SearchItem(label: '弾いてみた動画'),
    SearchItem(label: 'ギター'),
    SearchItem(label: 'バイオリン'),
    SearchItem(label: 'クラシック'),
    SearchItem(label: '機材'),
    SearchItem(label: 'アニソン'),
    SearchItem(label: 'レコーディング'),
    SearchItem(label: '音大受験'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/page_images/content.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color.fromRGBO(33, 33, 33, 0.93),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 190,
                ),
                const Text(
                  'あなたの経験、得意なことを',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '教えてください!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: '#検索',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      suffixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: searchItems.map((item) {
                      return ElevatedButton(
                        onPressed: () => setState(() {
                          item.isSelected = !item.isSelected;
                        }),
                        style: ElevatedButton.styleFrom(
                          // ボタンの背景色を設定
                          backgroundColor: item.isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          // ボタンの文字色を設定
                          foregroundColor:
                              item.isSelected ? Colors.white : Colors.grey,
                        ),
                        child: Text(
                          item.label,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                    height: 42,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(0, 87, 146, 1),
                          Color.fromRGBO(255, 185, 33, 1)
                        ], //青から緑へのグラデーション
                      ),
                    ),
                    child: ElevatedButton(
                      ///TODO画面を繋げる。
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        // グラデーション色を定義
                      ),
                      child: const Text(
                        'コミュニティに行く',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
