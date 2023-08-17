import 'package:flutter/material.dart';

/// Intro の モーダル内で利用する ListTile
class IntroModalListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final String leadingAssetPath;

  const IntroModalListTile({
    super.key,
    this.onTap,
    required this.label,
    required this.leadingAssetPath,
  });

  @override
  Widget build(context) {
    const iconSize = 24.0;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color(0xffeeeeee), spreadRadius: 1, blurRadius: 20),
        ],
      ),
      child: ListTile(
        leading: SizedBox(
          width: iconSize,
          child: Image.asset(leadingAssetPath),
        ),
        trailing: const SizedBox(width: iconSize),
        title: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(label),
        ),
        onTap: onTap,
      ),
    );
  }
}
