import 'package:flutter/material.dart';

///通知が溜まっている時の点
class Dot extends StatelessWidget {
  Dot({super.key, this.size = 10, this.color = const Color(0xffFACF39)});

  ///点のサイズ
  double size;

  ///点の色
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(90)),
        color: color,
      ),
    );
  }
}
