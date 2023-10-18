import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon:
            const Icon(Icons.chevron_left, color: Color(0xff0D253C), size: 32));
  }
}
