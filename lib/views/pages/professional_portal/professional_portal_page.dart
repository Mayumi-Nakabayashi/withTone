import 'package:flutter/material.dart';
import 'professional_portal_body.dart';

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
      body: NestedScrollView(
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

            body: ProfessionalPortalBody(
              professionalportalHeading: professionalportalHeading,
              professionalportalContent: professionalportalContent,
            ),
      ),
    );
  }
}

String professionalportalHeading = 'Harmonize, Connect, Inspire';
String professionalportalContent =
    'example';
String goodCount = '2.1k';