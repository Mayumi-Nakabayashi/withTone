import 'package:flutter/material.dart';

class ArticleBody extends StatelessWidget {
  ArticleBody(
      {super.key, required this.articleHeading, required this.articleContent});

  String articleHeading;
  String articleContent;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              articleHeading,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            child: Text(
              (articleContent),
            ),
          ),
        ],
      ),
    );
  }
}
