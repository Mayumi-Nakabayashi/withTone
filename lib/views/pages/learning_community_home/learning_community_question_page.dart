import 'package:flutter/material.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/pages/learning_community_home/widget/feedback_button.dart';
import 'package:withtone/views/pages/learning_community_home/widget/question_clip.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';

/// コミュニティ 質問ページ
class LearningCommunityQuestionPage extends StatefulWidget {
  const LearningCommunityQuestionPage({super.key});

  static const String path = '/learning_community_question';

  @override
  State<LearningCommunityQuestionPage> createState() =>
      _LearningCommunityQuestionPageState();
}

class _LearningCommunityQuestionPageState
    extends State<LearningCommunityQuestionPage> {
  final Map<String, dynamic> questionContents = {
    'title': 'このグリスどうですか？',
    'tags': ['バイオリン', 'おすすめの練習を教えてほしい'],
    'body':
        'Sometimes there’s no reason to smile, but I’ll smile anyway because of life. Yes, I’m one of those people who always smiles.',
  };

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
                'assets/page_images/feedback_video.png',
              ),
            ),
          ),
          Center(
            child: QuestionClip(
              contents: questionContents,
            ),
          ),
          const Positioned(
            bottom: 100,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SizedBox(height: 12), FeedBackButton()],
            ),
          ),
        ],
      ),
    );
  }
}
