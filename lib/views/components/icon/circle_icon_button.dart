import 'package:flutter/material.dart';

///丸の中にアイコンが入っているボタン
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.width = 44,
    this.height = 44,
    this.backgroundColor = Colors.transparent,
    this.iconColor = Colors.black,
    this.isBorder = true,
  });

  /// 中に入るアイコン
  final IconData icon;

  /// タップした時の処理
  final VoidCallback? onTap;

  /// ボタンの幅
  final double width;

  /// ボタンの高さ
  final double height;

  /// ボタンの背景の色
  final Color backgroundColor;

  /// アイコンの色
  final Color iconColor;

  /// 枠線が必要かどうか
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: isBorder == true
              ? Border.all(width: 1, color: Colors.grey)
              : null,
        ),
        child: Icon(
          icon,
          size: height * 0.7,
          color: iconColor,
        ),
      ),
    );
  }
}
