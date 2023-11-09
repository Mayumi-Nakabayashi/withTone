import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConstantlyMoving extends StatefulWidget {
  const ConstantlyMoving({super.key, this.size = 380, required this.asset});

  final double size;
  final String asset;

  @override
  State<ConstantlyMoving> createState() => _ConstantlyMovingState();
}

class _ConstantlyMovingState extends State<ConstantlyMoving> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();
    _composition = AssetLottie(widget.asset).load();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: FutureBuilder<LottieComposition>(
        future: _composition,
        builder: (context, snapshot) {
          var composition = snapshot.data;
          if (composition != null) {
            return Lottie(composition: composition);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
