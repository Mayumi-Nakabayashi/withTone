import 'package:flutter/material.dart';
import 'package:withtone/views/components/kamishibai.dart';
import 'package:withtone/views/pages/login/login_page.dart';
import 'package:withtone/views/pages/password_reissue/password_reissue_page.dart';
import 'package:withtone/views/pages/password_reissue_confirm/password_reissue_confirm_page.dart';

/// ルーティング管理
/// 基本的にインスタンス化せずに利用します
class Routes {
  /// 初期ページのルート名
  static const String initialRoute = '/';

  /// ルーティング一覧
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const Kamishibai(
          assetPath: 'assets/page_images/Intro.png',
          nextPathList: [LoginPage.path],
        ),
    LoginPage.path: (context) => LoginPage(),
    // const Kamishibai(
    //       assetPath: 'assets/page_images/login.png',
    //       nextPathList: [
    //         '/content',
    //         '/signup',
    //         PasswordReissuePage.path,
    //       ],
    //     ),
    '/signup': (context) => const Kamishibai(
          assetPath: 'assets/page_images/signup.png',
          nextPathList: [
            LoginPage.path,
            '/learning_community_search',
          ],
        ),
    PasswordReissuePage.path: (context) =>
        // const Kamishibai(
        //       assetPath: 'assets/page_images/パスワード再発行ページ.jpg',
        //       nextPathList: [
        //         PasswordReissueConfirmPage.path,
        //       ],
        //       existUserFlowOfPop: true,
        //     ),
        const PasswordReissuePage(),
    PasswordReissueConfirmPage.path: (context) =>
        // const Kamishibai(
        //       assetPath: 'assets/page_images/パスワード再発行確認ページ.jpg',
        //       nextPathList: ['/login'],
        //     ),
        const PasswordReissueConfirmPage(),
    '/learning_community_search': (context) => const Kamishibai(
          assetPath: 'assets/page_images/learning community search.png',
          nextPathList: ['/content'],
        ),
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
    '/upload_inst': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_inst.jpg',
          nextPathList: [
            '/upload_videoq',
          ],
          existUserFlowOfPop: true,
        ),
    '/upload_thankyouq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_thankyouq.jpg',
          nextPathList: ['/content'],
        ),
    '/upload_videoq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_videoq.jpg',
          nextPathList: [
            '/upload_commentq',
            '/content',
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
            '/content',
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
            '/content',
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
            '/content',
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
