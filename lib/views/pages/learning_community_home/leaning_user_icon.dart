import 'package:flutter/material.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';

class LeaningUserIcon extends StatelessWidget {
  const LeaningUserIcon(
      {super.key, required this.photUrl, required this.onPressed});
  final String photUrl;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 58,
        child: Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: const Color(0xffFFFFFF)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleProfileIcon(imageUrl: photUrl, isIcon: false, size: 48),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                right: 10,
                child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color(0xff005792)),
                    child:
                        const Icon(Icons.add, color: Colors.white, size: 20)))
          ],
        ),
      ),
    );
  }
}
