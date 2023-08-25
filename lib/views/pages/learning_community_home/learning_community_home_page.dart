import 'package:flutter/material.dart';

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
      body: Container(
        color: Colors.amber,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Text(runtimeType.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
