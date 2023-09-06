import 'package:flutter/material.dart';
import 'package:withtone/views/components/circle_icon_buttom.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/pages/profile/profile_buttom.dart';

///プロフェッショナルページのリストタイル
class ProfessionalTile extends StatelessWidget {
  const ProfessionalTile(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.introduction,
      required this.tags,
      required this.score,
      this.onPressed});

  ///名前
  final String name;

  ///画像URL
  final String imageUrl;

  ///自己紹介
  final String introduction;

  ///タグ？(とりあえずTextで実装、今後TextButton？)
  final String tags;

  ///星野横のスコア値
  final String score;

  ///アイコンをタップした時の処理
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffFFFFFF),
      surfaceTintColor: const Color(0xffFFFFFF),
      elevation: 1,
      margin: const EdgeInsets.only(right: 15.0, left: 15.0, top: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleProfileIcon(
                      imageUrl: imageUrl,
                      size: 44,
                      isIcon: false,
                      onPressed: onPressed,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            tags,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleIconButton(
                        icon: Icons.star,
                        onTap: () {},
                        width: 31,
                        height: 31,
                        isBorder: false,
                        iconColor: Colors.white,
                        backgroundColor: const Color(0xffFACF39)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(score),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              introduction,
            ),
          ),
          ProfileButtom(
            label: '直接相談する！',
            onPressed: () {},
            borderColor: const Color(0xffFFB921),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
