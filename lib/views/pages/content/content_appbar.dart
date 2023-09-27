import 'package:flutter/material.dart';

class ContentAppBar extends StatelessWidget {
  ContentAppBar({
    super.key,
    this.title = const SizedBox.shrink(),
    List<Widget>? actions,
  }) : actions = actions ?? [const SizedBox.shrink()];

  Widget title;
  List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            )
          ],
        ),
      ),
    );
  }
}
