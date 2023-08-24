import 'package:flutter/material.dart';
import 'package:withtone/upload_inst_page.dart';
import 'package:withtone/views/components/kamishibai.dart';
import 'package:withtone/views/pages/home_page.dart';
import 'package:withtone/views/pages/intro/intro_page.dart';
import 'package:withtone/views/pages/login_mail/login_mail_page.dart';
import 'package:withtone/views/learning_community_search.dart';
import 'package:withtone/views/pages/password_reissue/password_reissue_page.dart';
import 'package:withtone/views/pages/password_reissue_confirm/password_reissue_confirm_page.dart';
import 'package:withtone/views/pages/signup_mail/signup_mail.dart';

/// ルーティング管理
/// 基本的にインスタンス化せずに利用します
class Routes {
  /// 初期ページのルート名
  static const String initialRoute = IntroPage.path;

  /// ルーティング一覧
  static final Map<String, Widget Function(BuildContext)> routes = {
    IntroPage.path: (context) => const IntroPage(),
    LoginMailPage.path: (context) => const LoginMailPage(),
    SignupMailPage.path: (context) => const SignupMailPage(),
    '/': (context) => const Kamishibai(
          assetPath: 'assets/page_images/Intro.png',
          nextPathList: [IntroPage.path],
        ),
    '/signup': (context) => const Kamishibai(
          assetPath: 'assets/page_images/signup.png',
          nextPathList: [
            LeaningCommunitySearch.path,
          ],
        ),
    PasswordReissuePage.path: (context) => const PasswordReissuePage(),
    PasswordReissueConfirmPage.path: (context) =>
        const PasswordReissueConfirmPage(),
    HomePage.path: (context) => const HomePage(),
    LeaningCommunitySearch.path: (context) => const LeaningCommunitySearch(),
    '/content': (context) => const Kamishibai(
          assetPath: 'assets/page_images/content.png',
          nextPathList: [
            '/search',
            '/profile',
            '/article',
            '/learning_community_home',
            '/search',
            '/upload_fb',
            '/professional',
            '/content',
          ],
        ),
    '/upload_commentq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_commentq.jpg',
          nextPathList: ['/upload_thankyouq'],
          existUserFlowOfPop: true, // 戻ったら撮影した動画はどうなるの?
        ),
    '/upload_fb': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_fb.jpg',
          nextPathList: [
            '/upload_inst',
          ],
          existUserFlowOfPop: true,
        ),
    UploadInstPage.path: (context) => const UploadInstPage(),
    '/upload_thankyouq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_thankyouq.jpg',
          nextPathList: [HomePage.path],
        ),
    '/upload_videoq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_videoq.jpg',
          nextPathList: [
            '/upload_commentq',
            HomePage.path,
          ],
        ),
    '/learning_community_home': (context) => const Kamishibai(
          assetPath: 'assets/page_images/learning community home.png',
          nextPathList: [
            '/question',
            '/feedback_line',
            '/search',
            '/upload_fb',
            '/professional',
            HomePage.path,
          ],
        ),
    '/article': (context) => const Kamishibai(
          assetPath: 'assets/page_images/article.png',
          nextPathList: [],
          existUserFlowOfPop: true,
        ),
    '/professional': (context) => const Kamishibai(
          assetPath: 'assets/page_images/professional.png',
          nextPathList: [
            '/search',
            '/upload_fb',
            '/professional',
            HomePage.path,
          ],
        ),
    '/profile': (context) => const Kamishibai(
          assetPath: 'assets/page_images/profile.png',
          nextPathList: [
            '/settings',
          ],
          existUserFlowOfPop: true,
        ),
    '/search': (context) => const Kamishibai(
          assetPath: 'assets/page_images/search.png',
          nextPathList: [
            '/search',
            '/upload_fb',
            '/professional',
            HomePage.path,
          ],
        ),
    '/question': (context) => const Kamishibai(
          assetPath: 'assets/page_images/question.png',
          nextPathList: [
            '/feedback_line',
            '/upload_videof',
          ],
          existUserFlowOfPop: true,
        ),
    '/feedback_line': (context) => const Kamishibai(
          assetPath: 'assets/page_images/feedback_line.png',
          nextPathList: [
            '/feedback_video',
          ],
          existUserFlowOfPop: true,
        ),
    '/feedback_video': (context) => const Kamishibai(
          assetPath: 'assets/page_images/feedback_video.png',
          nextPathList: [
            '/feedback',
          ],
          existUserFlowOfPop: true,
        ),
    '/feedback': (context) => const Kamishibai(
          assetPath: 'assets/page_images/feedback.png',
          nextPathList: [],
          existUserFlowOfPop: true,
        ),
    '/upload_videof': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_videof.jpg',
          nextPathList: ['/upload_thankyouf'],
          existUserFlowOfPop: true,
        ),
    '/upload_thankyouf': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_thankyouf.jpg',
          nextPathList: ['/learning_community_home'],
        ),
    '/settings': (context) => const Kamishibai(
          assetPath: 'assets/page_images/settings.png',
          nextPathList: [],
          existUserFlowOfPop: true,
        ),
    '/notifications': (context) => const Kamishibai(
          assetPath: 'assets/page_images/notifications.png',
          nextPathList: [],
          existUserFlowOfPop: true,
        ),
  };
}
