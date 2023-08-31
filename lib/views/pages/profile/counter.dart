import 'package:flutter/material.dart';

///フォロワー数などの数を表示するウィジェト
class Counter extends StatelessWidget {
  const Counter({super.key, required this.count, required this.label});

  ///カウントする数字
  final int count;

  ///カウントする項目名
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 10, bottom: 10),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 15, color: Color(0xFF919191)),
          )
        ],
      ),
    );
  }
}
