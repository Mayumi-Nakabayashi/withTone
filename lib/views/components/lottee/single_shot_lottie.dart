import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SingleShotLottie extends StatefulWidget {
  const SingleShotLottie({super.key, required this.asset});
  final String asset;

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
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Lottie.asset(
            widget.asset,
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().then((value) => _controller.reset());
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _controller.forward().then((value) => _controller.reset());
              });
            },
            child: const Text('もう一度みる'))
      ],
    );
  }
}
