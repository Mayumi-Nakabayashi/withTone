import 'package:flutter/material.dart';

/// プロフィールアイコン（四角）
class RectangleProfileIcon extends StatelessWidget {
  const RectangleProfileIcon({
    super.key,
    required this.imageUrl,
    this.onPressed,
    this.iconData = Icons.error,
    this.isIcon = true,
    this.size = 90.0,
    this.textSize = 15,
    // デフォルト値を指定
  });

  ///アイコンの背景の画像
  final String imageUrl;

  ///全面に表示されるアイコン　※IconDataにするかIconにするか？
  final IconData iconData;

  ///アイコンをタップした時の処理
  final VoidCallback? onPressed;

  ///アイコンの有無
  final bool isIcon;

  ///アイコンのサイズ
  final double size;

  ///ラベルの文字サイズ
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // 写真を背景に設定
              Container(
                width: size, // ここでサイズを調整できます。
                height: size, // 同上
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 黒いフィルター（オーバーレイ）を写真の上に追加
              isIcon == true
                  ? Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.black
                            .withOpacity(0.5), // ここの値で黒さを調整（0.0 ~ 1.0）。
                      ),
                    )
                  : const SizedBox.square(),
              isIcon == true
                  ? Icon(iconData, color: Colors.white, size: 40)
                  : const SizedBox.square(),
            ],
          ),
        ),
      ],
    );
  }
}
