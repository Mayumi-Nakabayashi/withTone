import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// フィードバックのコメントかくテキストフィールド
class FeedBackTextForm extends ConsumerWidget {
  const FeedBackTextForm({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 32.0),
            child: TextFormField(
              maxLines: 99,
              minLines: 1,
              onChanged: (value) {},
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add feedback... ',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 35, horizontal: 8),
                fillColor: const Color(0xffFFFFFF),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
