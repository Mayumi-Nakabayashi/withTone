import 'package:flutter/material.dart';

/// アプリ上でよく利用するボタン
///
/// ButtonBar とは分けた方が良いかもだが、一旦このまま共通化する
class PrimaryButton extends StatelessWidget {
  ///ボタンに表示するラベル文言
  final String label;

  /// ボタンタップで発火する処理
  final VoidCallback? onPressed;
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final TextStyle _style = const TextStyle(
    height: 60 / 18,
    fontWeight: FontWeight.w800,
    fontSize: 18,
  );

  @override
  Widget build(context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            backgroundColor: const Color(0xff005792),
            foregroundColor: const Color(0xffffffff),
            surfaceTintColor: const Color(0xff005792),
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Text(label, style: _style),
        ),
      ],
    );
  }
}
