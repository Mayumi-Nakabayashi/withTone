import 'package:flutter/material.dart';

//設置とプライバシー画面のリストタイルのカテゴリを区切るためのウィジェット(上に線、その下にカテゴリ名)
class SettingsTitle extends StatelessWidget {
  const SettingsTitle(
      {super.key, required this.title, this.color = Colors.black38});

  //カテゴリ名
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1, //高さ
              color: Colors.black38, //色
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(title, textAlign: TextAlign.start),
            ),
          ),
        ),
      ],
    );
  }
}
