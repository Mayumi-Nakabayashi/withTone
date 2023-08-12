import 'package:flutter/material.dart';

/// 画面遷移を確認する為の仮画面
///
/// 背景に figma で作成したデザイン画像を配置する.
/// 画面遷移を nextPathList, existUserFlowOfPop で再現する.
///
/// 各ページ開発着手する際に class 定義して作成するまでのつなぎです.
///
/// ```
/// const Kamishibai(
///   assetPath: 'assets/page_images/question.png',
///   nextPathList: [
///     '/feedback_line',
///     '/upload_videof',
///   ],
///   existUserFlowOfPop: true,
/// );
/// ```
class Kamishibai extends StatefulWidget {
  const Kamishibai({
    super.key,

    /// 背景画像ファイルパス 例えば `assets/page_images/xxx.png`
    required this.assetPath,

    /// 画面タップの遷移先. 例えば `[ '/', LoginPage.path ]`
    required this.nextPathList,

    /// pop する導線があるか
    this.existUserFlowOfPop = false,
  });

  final String assetPath;
  final List<String> nextPathList;
  final bool existUserFlowOfPop;

  @override
  State<Kamishibai> createState() => _KamishibaieState();
}

class _KamishibaieState extends State<Kamishibai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.assetPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.existUserFlowOfPop)
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('戻る'),
              ),
            ...widget.nextPathList
                .map(
                  (e) => ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, e),
                      child: Text(e)),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
