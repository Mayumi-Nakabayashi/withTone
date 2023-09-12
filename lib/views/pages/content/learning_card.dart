import 'package:flutter/material.dart';

// 記事カード
class LeaningCard extends StatelessWidget {
  const LeaningCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.timestamp,
    required this.subtitle,
    required this.tags,
    this.onPressed, // TODO: 遷移の実装はまだです
  });

  final String thumbnail;
  final String title;
  final String timestamp;
  final String subtitle;
  final List tags;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8.0),
      color: const Color(0xffFFFFFF),
      surfaceTintColor: const Color(0xffFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.asset(
                      thumbnail,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 24 / 14,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          timestamp,
                          style: const TextStyle(
                            height: 20 / 11,
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              subtitle,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                height: 20 / 12,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          tags.isEmpty
                              ? Container()
                              : Flexible(
                                  child: Text(
                                    tags.map((tag) => '#$tag').join(' '),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
