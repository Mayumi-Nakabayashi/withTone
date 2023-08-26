import 'package:flutter/material.dart';

/// 通知
class ProfessionalPage extends StatefulWidget {
  const ProfessionalPage({super.key});

  static const String path = '/professional';

  @override
  State<ProfessionalPage> createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
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
