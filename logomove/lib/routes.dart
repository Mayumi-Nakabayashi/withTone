import 'package:flutter/material.dart';
import 'package:withtone/kamishibai.dart';

/// ルーティング管理
/// 基本的にインスタンス化せずに利用します
class Routes {
  /// 初期ページのルート名
  static const String initialRoute = '/';

  /// ルーティング一覧
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const Kamishibai(
          assetPath: 'assets/page_images/Intro.png',
          nextPathList: ['/login'],
        ),
    '/login': (context) => const Kamishibai(
          assetPath: 'assets/page_images/login.png',
          nextPathList: [
            '/content',
            '/signup',
            '/password_reissue',
          ],
        ),
    '/signup': (context) => const Kamishibai(
          assetPath: 'assets/page_images/signup.png',
          nextPathList: [
            '/login',
            '/learning_community_search',
          ],
        ),
    '/password_reissue': (context) => const Kamishibai(
          assetPath: 'assets/page_images/パスワード再発行ページ.jpg',
          nextPathList: [
            '/login',
            '/password_reissue_confirm',
          ],
        ),
    '/password_reissue_confirm': (context) => const Kamishibai(
          assetPath: 'assets/page_images/パスワード再発行確認ページ.jpg',
          nextPathList: ['/login'],
        ),
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
        ),
    '/upload_fb': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_fb.jpg',
          nextPathList: [
            '/content',
            '/upload_inst',
          ],
        ),
    '/upload_inst': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_inst.jpg',
          nextPathList: [
            '/upload_fb',
            '/upload_videoq',
          ],
        ),
    '/upload_thankyouq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_thankyouq.jpg',
          nextPathList: ['/content'],
        ),
    '/upload_videoq': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_videoq.jpg',
          nextPathList: ['/upload_commentq'],
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
          nextPathList: ['/content'],
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
          nextPathList: ['/content'],
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
            '/learning_community_home',
            '/feedback_line',
            '/upload_videof',
          ],
        ),
    '/feedback_line': (context) => const Kamishibai(
          assetPath: 'assets/page_images/feedback_line.png',
          nextPathList: [
            '/learning_community_home',
            '/feedback_video',
          ],
        ),
    '/feedback_video': (context) => const Kamishibai(
          assetPath: 'assets/page_images/feedback_video.png',
          nextPathList: [
            '/feedback_line',
            '/feedback',
          ],
        ),
    '/feedback': (context) => const Kamishibai(
          assetPath: 'assets/page_images/feedback.png',
          nextPathList: ['/feedback_video'],
        ),
    '/upload_videof': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_videof.jpg',
          nextPathList: ['/upload_thankyouf'],
        ),
    '/upload_thankyouf': (context) => const Kamishibai(
          assetPath: 'assets/page_images/upload_thankyouf.jpg',
          nextPathList: ['/content'],
        ),
  };
}
