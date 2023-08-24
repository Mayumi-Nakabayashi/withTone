import 'package:flutter/material.dart';

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
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // タップ時の処理をここに書きます。
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              // 写真を背景に設定
                              Container(
                                width: 90, // ここでサイズを調整できます。
                                height: 90, // 同上
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/page_images/profile_icon.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // 黒いフィルター（オーバーレイ）を写真の上に追加
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(
                                      0.5), // ここの値で黒さを調整（0.0 ~ 1.0）。
                                ),
                              ),
                              // カメラのアイコンを上に重ねる
                              const Icon(Icons.photo_camera_outlined,
                                  color: Colors.white, size: 40),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '写真を変更',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // タップ時の処理をここに書きます。
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              // 写真を背景に設定
                              Container(
                                width: 90, // ここでサイズを調整できます。
                                height: 90, // 同上
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                  //何かしたらの動画のサムネが入る？
                                  // image: DecorationImage(
                                  //   image: AssetImage(
                                  //       'assets/page_images/profile_icon.png'),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              // 黒いフィルター（オーバーレイ）を写真の上に追加
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(
                                      0.5), // ここの値で黒さを調整（0.0 ~ 1.0）。
                                ),
                              ),
                              // カメラのアイコンを上に重ねる
                              const Icon(Icons.videocam_outlined,
                                  color: Colors.white, size: 40),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '動画を変更',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('名前'),
                      Text('木村 なつみ', style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ユーザー名'),
                      Text('jacob_w',
                          style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'tiktok.com@jacob_w',
                        style: TextStyle(color: Colors.grey),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.copy))
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('自己紹介'),
                      Text('自己紹介を追加',
                          style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
                PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: Container(height: 1, color: Colors.black38)),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('YouTube'),
                      Text('YouTubeを追加',
                          style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ));
  }
}
