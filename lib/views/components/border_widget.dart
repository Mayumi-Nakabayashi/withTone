import 'package:flutter/material.dart';

///設置とプライバシー画面のリストタイルのカテゴリを区切るためのウィジェット(上に線、その下にカテゴリ名)
class BorderWidget extends StatelessWidget {
  const BorderWidget({super.key, this.color = Colors.black38});

  ///borderの色デフォルトではColors.black38
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
      ],
    );
  }
}
