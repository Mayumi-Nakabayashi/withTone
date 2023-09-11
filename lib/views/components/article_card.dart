import 'package:flutter/material.dart';

// 記事カード
class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.width,
    required this.imagePath,
    required this.title,
    required this.timestamp,
    this.onPressed, // TODO: 遷移の実装はまだです
  });

  final double width;
  final String imagePath;
  final String title;
  final String timestamp;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      surfaceTintColor: const Color(0xffFFFFFF),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(
              right: 9.5, left: 9.5, top: 9.6, bottom: 7.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Image.asset(
                  imagePath,
                  height: 102,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  height: 16.3 / 12.65,
                  fontWeight: FontWeight.w800,
                  fontSize: 12.65,
                ),
              ),
              Text(
                timestamp,
                style: const TextStyle(
                  height: 18.1 / 13,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
