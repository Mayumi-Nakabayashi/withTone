import 'package:flutter/material.dart';

class ChangeButton extends StatelessWidget {
  const ChangeButton({
    super.key,
    required this.label,
    this.onPressed,
  });
  final String label;

  /// ボタンタップで発火する処理
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(double.maxFinite),

        ///すげー不自然
        backgroundColor: Colors.transparent,
        side: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
