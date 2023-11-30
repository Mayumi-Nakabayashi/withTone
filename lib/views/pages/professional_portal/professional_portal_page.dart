import 'package:flutter/material.dart';


/// プロフェッショナルポータルページ
class ProfessionalPortalPage extends StatefulWidget {
  const ProfessionalPortalPage({super.key});

  static const String path = '/professional_portal';

  @override
  State<ProfessionalPortalPage> createState() => _ProfessionalPortalPageState();
}

class _ProfessionalPortalPageState extends State<ProfessionalPortalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (BuildContext context,
                  bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 350.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace:
                    FlexibleSpaceBar(
                        centerTitle:
                        true, title:
                    const Text(
                        "Professional portalページ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,)
                    ),
                        background: Image.asset(
                            'assets/pictures/professional_portal_1.jpg',
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ];
              },
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      onPressed: () {
                      // TODO: 遷移先の実装
                    },
                      label: const Text(
                        '今すぐ質問する',
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ]
      ),
    );
  }
}
