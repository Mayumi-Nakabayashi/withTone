import 'package:flutter/material.dart';

///投稿者の情報と投稿日
class ContributorInfo extends StatelessWidget {
  const ContributorInfo({
    super.key,
    required this.name,
    required this.date,
    required this.imageUrl,
  });

  /// 投稿者の名前
  final String name;

  /// 投稿した日にち(とりあえずString)
  final String date;

  /// 投稿者のアイコン
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15)),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff005792),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff005792),
              ),
            )
          ],
        )
      ],
    );
  }
}
