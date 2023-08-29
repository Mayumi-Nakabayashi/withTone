import 'package:flutter/material.dart';

//設置とプライバシー画面のリストタイル
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    this.leadingIcon,
    required this.title,
    required this.onPressed,
  });

  //左側に表示されるアイコン
  final Icon? leadingIcon;
  //リストタイトルの要素
  final String title;
  //タップした時の処理
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: leadingIcon,
      trailing: const Icon(Icons.chevron_right_sharp),
      onTap: onPressed,
    );
  }
}
