import 'package:flutter/material.dart';

///プロフィール画面の写真や動画のリストを表示する
class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    required this.itemList,
  });

  ///表示したいアイテムのリスト
  final List itemList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 5.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 3, //ボックス左右間のスペース
          mainAxisSpacing: 3, //ボックス上下間のスペース
          crossAxisCount: 3, //ボックスを横に並べる数
          childAspectRatio: 1 / 1.3, // 縦横比1.3:1
        ),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(itemList[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: GestureDetector(
              onTap: () {
                //タップした時の処理
              },
            ),
          );
        });
  }
}
