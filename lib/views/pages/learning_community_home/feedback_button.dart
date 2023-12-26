import 'package:flutter/material.dart';
import 'package:withtone/models/post.dart';
import 'package:withtone/views/pages/learning_community_home/feedback/feedback_bottom_sheet.dart';

class FeedBackButton extends StatelessWidget {
  const FeedBackButton({super.key, required this.post});
  final Post post;
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
                  return FeedBackBottomSheet(
                    post: post,
                  );
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
