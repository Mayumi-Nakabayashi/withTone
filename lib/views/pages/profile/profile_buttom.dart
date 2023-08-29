import 'package:flutter/material.dart';

class ProfileButtom extends StatelessWidget {
  const ProfileButtom(
      {super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback? onPressed;

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
              color: Color(0xffE3E3E4), //色
              width: 1, //太さ
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}
