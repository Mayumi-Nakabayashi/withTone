import 'package:flutter/material.dart';

/// 通知
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  static const String path = '/notifications';

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
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
