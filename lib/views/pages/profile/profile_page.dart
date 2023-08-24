import 'package:flutter/material.dart';

/// プロフィール
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String path = '/content';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            icon: const Icon(Icons.more_horiz),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                child: const Text('setting ページに遷移'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
