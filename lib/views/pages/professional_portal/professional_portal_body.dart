import 'package:flutter/material.dart';

class ProfessionalPortalBody extends StatelessWidget {
  ProfessionalPortalBody({
    super.key,
    required this.professionalportalHeading,
    required this.professionalportalContent,
  });

  /// 記事の見出しテキスト
  final String professionalportalHeading;

  /// 記事の本文
  final String professionalportalContent;

  /// ボタン
  ///

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              professionalportalHeading,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: FloatingActionButton.extended(
              onPressed: () {
                // TODO: 遷移先の実装
              },
              label: const Text(
                'プロに登録',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Text((professionalportalContent)),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              professionalportalHeading,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(60.0),
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 25,
            //childAspectRatio: 3/4,  // アスペクト比
            children: [
              for (var i = 0; i < 6; i++)
                  Image.asset(
                    'assets/pictures/professional_portal_1.jpg', // 画像のファイルパス
                    width: 80.0,
                    height: 100.0,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
