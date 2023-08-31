import 'package:flutter/material.dart';

///四角い枠の中にテキストが入っているボタン
class ProfileButtom extends StatelessWidget {
  const ProfileButtom(
      {super.key,
      required this.label,
      required this.onPressed,
      this.borderColor = const Color(0xffE3E3E4)});

  ///中に入るテキスト
  final String label;

  ///ボタンを押した時の処理
  final VoidCallback? onPressed;

  ///ボタンの枠の色
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            side: BorderSide(
              color: borderColor, //色
              width: 1, //太さ
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }
}
