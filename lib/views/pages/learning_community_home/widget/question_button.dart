import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:withtone/views/pages/upload_feedback/upload_question_fb_page.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    const double blurButtonWidth = 258;
    const double blurButtonHeight = 65;

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          alignment: Alignment.center,
          width: blurButtonWidth,
          height: blurButtonHeight,
          decoration: ShapeDecoration(
            color: const Color(0x198C8C8C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: TextButton(
            onPressed: () {
              // TODO: ここの遷移先は仮です。修正してください。
              Navigator.pushNamed(context, UploadQuestionFBPage.path);
            },
            style: TextButton.styleFrom(
              fixedSize: const Size(blurButtonWidth, blurButtonHeight),
              foregroundColor: Colors.white,
            ),
            child: const Text(
              '質問やティップスをみる',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
