import 'package:flutter/material.dart';

class LeaningCommunitySearch extends StatefulWidget {
  const LeaningCommunitySearch({super.key});

  static const String path = '/learning_community_search';

  @override
  State<LeaningCommunitySearch> createState() => _LeaningCommunitySearchState();
}

class _LeaningCommunitySearchState extends State<LeaningCommunitySearch> {
  bool isPressed = false;
  Color _buttonColor = Colors.white;
  Color _textColor = Colors.grey;

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
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        isPressed = !isPressed;
                        setState(() {
                          _buttonColor = isPressed
                              ? const Color.fromRGBO(0, 87, 146, 78)
                              : Colors.white;
                          _textColor = isPressed ? Colors.white : Colors.grey;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _buttonColor, // ボタンの色を設定
                      ),
                      child: Text(
                        '作曲',
                        style: TextStyle(
                          color: _textColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('路上パフォーマンス'),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('ピアノ'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('DTM'),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('弾いてみた動画'),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('ギター'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('バイオリン'),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('クラシック'),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('機材'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('アニソン'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('レコーディング'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('音大受験'),
                    ),
                  ],
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
