import 'package:flutter/material.dart';

class BackgroundColor extends StatelessWidget {
  const BackgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF5F6FC), // 上の背景色
            Colors.white, // 下の背景色
          ],
          stops: [0.35, 0.25], // グラデーションの境界を指定
        ),
      ),
    );
  }
}
