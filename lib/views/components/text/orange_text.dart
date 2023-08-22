import 'package:flutter/material.dart';

class OrangeText extends StatelessWidget {
  const OrangeText({super.key, required this.label});

  final String label;

  final TextStyle _style = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(255, 185, 33, 1),
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        label,
        style: _style,
      ),
    );
  }
}
