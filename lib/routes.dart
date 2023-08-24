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
    // 画面起動からホームに遷移するまで
    IntroPage.path: (context) => const IntroPage(),
    LoginMailPage.path: (context) => const LoginMailPage(),
    SignupMailPage.path: (context) => const SignupMailPage(),
    // Intro 作ったので削除する
    '/': (context) => const Kamishibai(
          assetPath: 'assets/page_images/Intro.png',
          nextPathList: [IntroPage.path],
        ),
    // Intro 作ったので削除する
    '/signup': (context) => const Kamishibai(
          assetPath: 'assets/page_images/signup.png',
          nextPathList: [
            LeaningCommunitySearch.path,
          ],
        ),
    PasswordReissuePage.path: (context) => const PasswordReissuePage(),
    PasswordReissueConfirmPage.path: (context) =>
        const PasswordReissueConfirmPage(),
    LeaningCommunitySearch.path: (context) => const LeaningCommunitySearch(),

    // ホーム画面
    // routes にないが, HomePage 内部で 5 画面管理している
    HomePage.path: (context) => const HomePage(),
    // ホームで管理するのでここから消す
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
    // ホームで管理するのでここから消す
    '/notifications': (context) => const Kamishibai(
          assetPath: 'assets/page_images/notifications.png',
          nextPathList: [],
          existUserFlowOfPop: true,
        ),
    // ホームで管理するのでここから消す
    '/upload_fb': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_fb.jpg',
          nextPathList: [
            '/upload_inst',
          ],
          existUserFlowOfPop: true,
        ),
    // ホームで管理するのでここから消す
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
    // ホームで管理するのでここから消す
    '/professional': (context) => const Kamishibai(
          assetPath: 'assets/page_images/professional.png',
          nextPathList: [
            '/search',
            '/upload_fb',
            '/professional',
            HomePage.path,
          ],
        ),
    // 8 月中に作る
    '/upload_videoq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_videoq.jpg',
          nextPathList: [
            '/upload_commentq',
            HomePage.path,
          ],
        ),
    // 8 月中に作る
    '/profile': (context) => const Kamishibai(
          assetPath: 'assets/page_images/profile.png',
          nextPathList: [
            '/settings',
          ],
          existUserFlowOfPop: true,
        ),
    // その他
    '/upload_commentq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_commentq.jpg',
          nextPathList: ['/upload_thankyouq'],
          existUserFlowOfPop: true, // 戻ったら撮影した動画はどうなるの?
        ),

    UploadInstPage.path: (context) => const UploadInstPage(),
    '/upload_thankyouq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_thankyouq.jpg',
          nextPathList: [HomePage.path],
        ),
    '/article': (context) => const Kamishibai(
          assetPath: 'assets/page_images/article.png',
          nextPathList: [],
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
  };
}
