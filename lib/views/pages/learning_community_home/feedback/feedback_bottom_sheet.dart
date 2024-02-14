import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/models/post/post.dart';
import 'package:withtone/providers/feedback/feedback_list.dart';
import 'package:withtone/views/components/error_dialog.dart';
import 'package:withtone/views/pages/learning_community_home/feedback/feedback_list_tile.dart';
import 'package:withtone/views/pages/learning_community_home/feedback/feedback_text_form.dart';
import 'package:withtone/views/pages/learning_community_home/feedback/send_button.dart';

class FeedBackBottomSheet extends ConsumerStatefulWidget {
  const FeedBackBottomSheet({super.key, required this.post});
  final Post post;

  static const String path = '/upload_commentq';

  @override
  ConsumerState<FeedBackBottomSheet> createState() =>
      _FeedBackBottomSheetState();
}

class _FeedBackBottomSheetState extends ConsumerState<FeedBackBottomSheet> {
  final TextEditingController _feedBackTextController = TextEditingController();

  @override
  void dispose() {
    _feedBackTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feedbackList = ref.watch(feedbackListProvider(widget.post));
    return Container(
        height: MediaQuery.of(context).size.height * 0.8, //画面の高さの80%の高さ
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Color(0xffF5F5F4),
        ),
        child: feedbackList.when(
            data: (data) {
              //feedback取得後の処理
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      Text(
                        '${data.length.toString()} Feedbacks',
                        style: const TextStyle(
                            fontSize: 13, color: Color(0xff161722)),
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
                    child: RefreshIndicator(
                      onRefresh: () async {
                        final notifier = ref
                            .read(feedbackListProvider(widget.post).notifier);
                        await notifier.refreshFeedback(widget.post);
                      },
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return FeedBackListTile(comment: data[i].comment);
                        },
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      SendButton(onPressed: () async {
                        final notifier = ref
                            .read(feedbackListProvider(widget.post).notifier);
                        await notifier
                            .addFeedback(
                                _feedBackTextController.text, widget.post)
                            .then((value) {
                          _feedBackTextController.clear();
                        }).catchError((e) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ErrorDialog(e: e);
                              });
                        });
                      }),
                      FeedBackTextForm(controller: _feedBackTextController),
                    ],
                  )
                ],
              );
            },
            loading: () {
              //feedback取得中の処理
              return const Center(child: CircularProgressIndicator());
            },
            //feedback取得でエラーだった場合の処理
            error: (error, stackTrace) => const Center(
                  child: Text('error'),
                )));
  }
}
