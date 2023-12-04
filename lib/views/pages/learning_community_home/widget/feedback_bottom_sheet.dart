import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:withtone/providers/feedback/add_feedback.dart';
import 'package:withtone/views/components/error_dialog.dart';
import 'package:withtone/views/pages/learning_community_home/widget/feedback_list_tile.dart';
import 'package:withtone/views/pages/learning_community_home/widget/feedback_text_form.dart';
import 'package:withtone/views/pages/learning_community_home/widget/send_button.dart';

class FeedBackBottomSheet extends HookConsumerWidget {
  const FeedBackBottomSheet({super.key, required this.feedBacks});

  ///コメントのリスト
  final List feedBacks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedBackTextController = useTextEditingController();
    return Container(
        height: MediaQuery.of(context).size.height * 0.8, //画面の高さの1/8の高さ
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Color(0xffF5F5F4),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                Text(
                  '${feedBacks.length.toString()} Feedbacks',
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xff161722)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close, size: 16)),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: feedBacks.length,
                itemBuilder: (context, i) {
                  return FeedBackListTile(feedBack: feedBacks[i]);
                },
              ),
            ),
            Stack(
              children: [
                SendButton(onPressed: () async {
                  final notifier = ref.read(addFeedbackProvider.notifier);
                  await notifier
                      .addFeedback(feedBackTextController.text)
                      .then((value) => feedBackTextController.clear())
                      .catchError((e) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ErrorDialog(e: e);
                        });
                  });
                }),
                FeedBackTextForm(controller: feedBackTextController),
              ],
            )
          ],
        ));
  }
}
