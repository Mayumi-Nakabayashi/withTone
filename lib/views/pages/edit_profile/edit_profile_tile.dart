import 'package:flutter/material.dart';

//プロフィール編集画面のリストタイル
class EditProfileTile extends StatelessWidget {
  const EditProfileTile(
      {super.key, required this.title, required this.contents});

  //リストタイルのタイトル(一番左のテキスト)
  final String title;
  //リストタイルの要素(データベースから取得した値)
  final String contents;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(contents, style: const TextStyle(color: Colors.grey))
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
