import 'package:flutter/material.dart';
import 'package:withtone/views/components/dot.dart';

/// 設置とプライバシー画面のリストタイル
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    this.leadingIcon,
    required this.title,
    required this.onPressed,
    this.isNewArrival = false,
  });

  /// 左側に表示されるアイコン
  final Icon? leadingIcon;

  /// リストタイトルの要素
  final String title;

  /// タップした時の処理
  final VoidCallback? onPressed;

  /// trueだったらtitleの横にDot表示(通知の有無区別する)
  final bool isNewArrival;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(title),
          isNewArrival ? const Dot() : const SizedBox.shrink()
        ],
      ),
      leading: leadingIcon,
      trailing: const Icon(Icons.chevron_right_sharp),
      onTap: onPressed,
    );
  }
}
