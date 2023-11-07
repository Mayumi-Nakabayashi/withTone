import 'package:flutter/material.dart';
import 'package:withtone/views/pages/learning_community_home/widget/feedback_bottom_sheet.dart';

class FeedBackButton extends StatelessWidget {
  const FeedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return FeedBackBottomSheet(feedBacks: feedBacks);
                });
          },
          child: const Icon(Icons.comment, color: Color(0xffFFFFFF), size: 35),
        ),
        const Text('フィード\nバック',
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xffFFFFFF)),
            textAlign: TextAlign.center)
      ],
    );
  }
}

///おそらくここにUserの情報だったりリプライのrefのパスなどのクラスになる。
///とりあえずフィードバックコメントのみ
final feedBacks = [
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ',
];
