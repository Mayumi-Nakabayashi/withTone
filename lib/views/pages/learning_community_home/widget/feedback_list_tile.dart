import 'package:flutter/material.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/pages/learning_community_home/widget/feedback_favorite_button.dart';

class FeedBackListTile extends StatelessWidget {
  const FeedBackListTile({super.key, required this.feedBack});
  final String feedBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 16.0, left: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  CircleProfileIcon(
                    imageUrl:
                        'https://avatars.githubusercontent.com/u/79615420?s=60&v=4',
                    isIcon: false,
                    size: 38,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Jordi Alaba',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff161722)),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 84,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.amber),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  const FeedBackFavoriteButton(
                    size: 20,
                    textColor: Colors.black,
                    falseColor: Color(0xff86878B),
                  ),
                  const SizedBox(width: 16)
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(feedBack),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'View replies (4)',
                style: TextStyle(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.expand_more, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
