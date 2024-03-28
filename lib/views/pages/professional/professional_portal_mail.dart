import 'package:flutter/material.dart';

class ProfessionalPortalMail extends StatelessWidget {
  const ProfessionalPortalMail({super.key});

  static const String path = '/professional_portal_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/page_images/app_nobackground2.png'),
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ご登録ありがとうございます!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF005792),
                  ),
                ),
                SizedBox(height: 34),
                Text(
                  '直接相談リクエストを',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  '受け取れるようになりました！',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
