import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';

/// 開発用に何をしても良い画面
///
/// 開発の為に 試したい処理や Viewパーツをここで試すことができる.
class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              onPressed: () {
                /* 処理 */
              },
              label: 'エラーログ送信',
            ),
          ],
        ),
      ),
    );
  }
}
