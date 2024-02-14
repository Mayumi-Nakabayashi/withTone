import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/providers/post/post_list.dart';
import 'package:withtone/views/pages/learning_community_home/learning_community_tile.dart';

class LearningCommunityHomePage extends ConsumerWidget {
  const LearningCommunityHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postListProvider);
    return postList.when(
        loading: () {
          // post取得中の処理
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        data: (data) {
          // post取得後の処理
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (context, i) {
                  final post = data[i];
                  return LearningCommunityTile(
                    post: post,
                  );
                }),
          );
        },
        // post取得でエラーだった場合の処理
        error: (error, stackTrace) => const Center(
              child: Text('error'),
            ));
  }
}
