import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Lottie をスライドショーで表示するWidget
class SlideShowLottie extends StatefulWidget {
  const SlideShowLottie({
    super.key,
    required this.assetsList,
    this.width = 300,
    this.height = 300,
    this.isBorder = false,
  });

  ///スライドショーのassetのリスト
  final List assetsList;

  ///スライドショーの幅(デフォルト300)
  final double width;

  ///スライドショーの高さ(デフォルト300)
  final double height;

  ///スライドショーの範囲の枠を表示するかしないか(デフォルトでは表示しない)
  final bool isBorder;

  @override
  _SlideShowLottieState createState() => _SlideShowLottieState();
}

class _SlideShowLottieState extends State<SlideShowLottie>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controllre = AnimationController(
        vsync: this,

        //Durationの値で再生から終了までにかかる時間を設定できる。指定なしであれば元々のファイルの再生時間で再生
        duration: const Duration(seconds: 5));

    void startAnimation() {
      if (controllre.value == 0) {
        controllre.forward().then((value) => controllre.reset());
      }
      if (controllre.value != 0) {
        controllre.reset();
        controllre.forward();
      }
    }

    void stopAnimation() {
      controllre.stop();
    }

    var pageController = PageController();

    _onChanged(int page) {
      startAnimation();
    }

    startAnimation();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              border: widget.isBorder ? Border.all(color: Colors.black) : null,
            ),
            child: PageView.builder(
                itemCount: widget.assetsList.length,
                controller: pageController,
                onPageChanged: _onChanged,
                itemBuilder: (context, i) {
                  return LottieTile(
                      animationController: controllre,
                      assets: widget.assetsList[i]);
                })),
        ElevatedButton(
          child: const Text('もう一度見る'),
          onPressed: () {
            startAnimation();
          },
        ),
      ],
    );
  }
}

///スライドショーの中に入るタイル
class LottieTile extends StatelessWidget {
  const LottieTile(
      {super.key, required this.animationController, required this.assets});
  final AnimationController animationController;
  final String assets;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(assets, controller: animationController),
    );
  }
}
