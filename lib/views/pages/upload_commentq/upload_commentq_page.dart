import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:withtone/models/post.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/pages/home_page.dart';

/// 質問動画にコメントをつける画面
class UploadCommentqPage extends StatefulWidget {
  const UploadCommentqPage({super.key});

  static const String path = '/upload_commentq';

  @override
  State<UploadCommentqPage> createState() => _UploadCommentqPageState();
}

class _UploadCommentqPageState extends State<UploadCommentqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('コメント')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(
              width: double.infinity,
              child: Text('#ハッシュタグ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            const TextField(
              decoration: InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLength: 300,
              maxLines: null,
            ),
            const SizedBox(height: 20),
            // TODO: ここに動画を表示する
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: '質問を投稿',
              onPressed: () {
                // 仮投稿作成
                // documentId が欲しいので、一度 add してから update する
                FirebaseFirestore.instance.collection('posts').add({}).then(
                  (docRef) {
                    final docId = docRef.id;
                    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
                    final post = Post(
                      id: docId, // 後で更新して入れる
                      uid: uid,
                      title: '【超初心者】バイオリンを買ってから７日間の練習メニュー',
                      body: '''
バイオリンを始めたばかりの超初心者用の動画です。
７日間でバイオリンの準備から持ち方、簡単な曲にチャレンジ！
''',
                      // 先に動画をアップロードして、そのURLを入れる
                      movieUrl: 'https://www.youtube.com/watch?v=8HqQ3XgxBhY',
                      tags: ['#バイオリン', '#初心者', '#質問歓迎'],
                      // これは自動で入れたい
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                    );
                    // post を更新
                    FirebaseFirestore.instance
                        .collection('posts')
                        .doc(docId)
                        .update(post.toJson());
                    // いいねをつける 別にここでやらなくても良いが、データ型の確認の為
                    FirebaseFirestore.instance
                        .collection('posts')
                        .doc(docId)
                        .collection('favorite')
                        .add({
                      'users': [uid]
                    });
                  },
                );
                Navigator.of(context).pushNamed(HomePage.path);
              },
            )
          ]),
        ),
      ),
    );
  }
}
