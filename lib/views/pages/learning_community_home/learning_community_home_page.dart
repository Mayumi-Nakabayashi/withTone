import 'package:flutter/material.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/pages/learning_community_home/widget/feedback_button.dart';
import 'package:withtone/views/pages/learning_community_home/widget/feedback_favorite_button.dart';
import 'package:withtone/views/pages/learning_community_home/widget/leaning_user_icon.dart';
import 'package:withtone/views/pages/learning_community_home/widget/question_button.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';

/// コミュニティ
class LearningCommunityHomePage extends StatefulWidget {
  const LearningCommunityHomePage({super.key});

  static const String path = '/learning_community_home';

  @override
  State<LearningCommunityHomePage> createState() =>
      _LearningCommunityHomePageState();
}

class _LearningCommunityHomePageState extends State<LearningCommunityHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: Colors.amber,
              width: double.infinity,
              height: double.infinity,
              child: const Image(
                  image: AssetImage('assets/page_images/feedback_video.png'))),
          const Center(child: QuestionButton()),
          Positioned(
            bottom: 100,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LeaningUserIcon(
                  photUrl:
                      'https://avatars.githubusercontent.com/u/79615420?s=60&v=4',
                  onPressed: () {},
                ),
                const SizedBox(height: 12),
                const FeedBackFavoriteButton(),
                const SizedBox(height: 12),
                const FeedBackButton()
              ],
            ),
          ),
          Positioned(
              top: 68,
              right: 18,
              child: CircleProfileIcon(
                  size: 44,
                  isIcon: false,
                  onPressed: () {
                    Navigator.pushNamed(context, ProfilePage.path);
                  },
                  imageUrl:
                      'https://avatars.githubusercontent.com/u/79615420?s=60&v=4')),
          const Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'このグリスどうですか？',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '#バイオリン #おすすめの練習を教えてほしい',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
