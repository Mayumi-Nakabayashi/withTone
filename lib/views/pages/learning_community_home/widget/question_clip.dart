import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class QuestionClip extends StatelessWidget {
  const QuestionClip({required this.contents, super.key});
  final Map<String, dynamic> contents;

  @override
  Widget build(BuildContext context) {
    const double blurButtonWidth = 295;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          width: blurButtonWidth,
          decoration: ShapeDecoration(
            color: const Color(0x198C8C8C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  contents['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 2,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                contents['tags'].isEmpty || contents['tags'] == null
                    ? Container()
                    : Flexible(
                        child: Text(
                          contents['tags'].map((tag) => '#$tag').join(' '),
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            height: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                Text(
                  contents['body'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
