import 'package:flutter/material.dart';

class Kamishibai extends StatefulWidget {
  const Kamishibai({
    super.key,

    /// 背景画像ファイルパス 例えば `assets/page_images/xxx.png`
    required this.assetPath,

    /// 画面タップの遷移先. 例えば `[ '/login', '/content' ]`
    required this.nextPathList,
  });

  final String assetPath;
  final List<String> nextPathList;

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
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.nextPathList
              .map(
                (e) => ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, e),
                    child: Text(e)),
              )
              .toList(),
        ),
      ),
    );
  }
}
