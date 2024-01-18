import 'package:flutter/material.dart';
import 'package:withtone/models/post/post.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/pages/learning_community_home/feedback_button.dart';
import 'package:withtone/views/pages/learning_community_home/feedback_favorite_button.dart';
import 'package:withtone/views/pages/learning_community_home/leaning_user_icon.dart';
import 'package:withtone/views/pages/learning_community_home/question_button.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';

/// コミュニティ
class LearningCommunityTile extends StatefulWidget {
  const LearningCommunityTile({super.key, required this.post});
  final Post post;
  static const String path = '/learning_community_home';

  @override
  State<LearningCommunityTile> createState() =>
      _LearningCommunityHomePageState();
}

class _LearningCommunityHomePageState extends State<LearningCommunityTile> {
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
                  image: AssetImage(
                      'assets/page_images/feedback_video.png'))), //TODO UserDB機能実装後修正
          const Center(child: QuestionButton()),
          Positioned(
            bottom: 100,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LeaningUserIcon(
                  photUrl:
                      'https://avatars.githubusercontent.com/u/79615420?s=60&v=4', //TODO video機能実装後修正
                  onPressed: () {},
                ),
                const SizedBox(height: 12),
                const FeedBackFavoriteButton(),
                const SizedBox(height: 12),
                FeedBackButton(post: widget.post)
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
                      'https://avatars.githubusercontent.com/u/79615420?s=60&v=4')), //TODO UserDB機能実装後修正
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  generateTagString(widget.post.tags),
                  style: const TextStyle(
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

String generateTagString(List<String> tags) {
  return tags.join(' ');
}
