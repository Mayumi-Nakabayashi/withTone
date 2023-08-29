//IDをコピーする
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyTile extends StatelessWidget {
  const CopyTile({super.key, required this.id});

  //コピーしたいText
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(id, style: const TextStyle(color: Colors.grey)),
          IconButton(
              onPressed: () {
                //クリップボードにコピーするメソッド
                Clipboard.setData(ClipboardData(text: id));

                //コピー完了のダイアログ
                //ID以外にも使用する可能性がある場合ここのTextを変数にする？
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('IDをコピーしました。'),
                        content: TextButton(
                          child: const Text('閉じる'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.copy))
        ],
      ),
    );
  }
}
