import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Lottieファイルを一度だけ再生するWidget
class SingleShotLottie extends StatefulWidget {
  const SingleShotLottie({
    super.key,
    required this.asset,
    this.size = 320,
  });

  /// lottieファイルのassetパス
  final String asset;

  /// 表示サイズ
  final double size;

  @override
  State<SingleShotLottie> createState() => _SingleShotLottieState();
}

class _SingleShotLottieState extends State<SingleShotLottie>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Lottie.asset(
        widget.asset,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward();
        },
      ),
    );
  }
}
