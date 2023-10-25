import 'package:flutter/material.dart';
import 'package:withtone/views/components/favorite_button.dart';

class FeedBackFavoriteButton extends StatelessWidget {
  const FeedBackFavoriteButton({
    super.key,
    this.size = 35,
    this.textColor = const Color(0xffFFFFFF),
    this.trueColor = const Color(0xffEA4359),
    this.falseColor = const Color(0xffDFE1D9),
  });

  /// アイコンのサイズ
  final double size;
  //カウントのテキストの色
  final Color textColor;

  ///お気に入りしている時の色
  final Color trueColor;

  ///お気に入りしていない時の色
  final Color falseColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FavoriteBotton(
          size: size,
        ),
        Text(
          '45',
          style: TextStyle(fontSize: 13, color: textColor),
        )
      ],
    );
  }
}
