import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 16,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: const Color(0xff005792)),
        child: GestureDetector(
          onTap: onPressed,
          child: const Icon(
            Icons.arrow_upward,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
