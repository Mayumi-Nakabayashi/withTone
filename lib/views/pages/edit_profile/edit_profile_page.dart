import 'package:flutter/material.dart';
import 'package:withtone/views/components/border_widget.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/pages/edit_profile/copy_tile.dart';
import 'package:withtone/views/pages/edit_profile/edit_profile_tile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  static const String path = '/edit_profile';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('プロフィールを編集'),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(height: 1, color: Colors.black38))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleProfileIcon(
                      imageUrl:
                          'https://pbs.twimg.com/profile_images/1410912969085444097/0g6BdWsP_400x400.jpg',
                      label: '写真を変更',
                      iconData: Icons.photo_camera_outlined,
                      onPressed: () {},
                    ),
                    CircleProfileIcon(
                      imageUrl:
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww2.fashion-guide.jp%2Fcolor%2Fgray-sample.html&psig=AOvVaw156bN6yRkEutWkZVTNKlpu&ust=1693462272626000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCJia0Nvcg4EDFQAAAAAdAAAAABAE',
                      label: '動画を変更',
                      iconData: Icons.videocam_outlined,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const EditProfileTile(title: '名前', contents: '木村　なつみ'),
                const EditProfileTile(title: 'ユーザー名', contents: 'jacob_w'),
                CopyTile(id: 'tiktok.com@jacob_w'),
                const EditProfileTile(title: '自己紹介', contents: '自己紹介を追加'),
                const BorderWidjet(),
                const EditProfileTile(title: 'YouTube', contents: 'YouTubeを追加'),
              ],
            ),
          ),
        ));
  }
}
