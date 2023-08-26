import 'package:flutter/material.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';

/// 学ぶ
class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  static const String path = '/content';

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, ProfilePage.path),
                child: const Text('profile ページに遷移'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
