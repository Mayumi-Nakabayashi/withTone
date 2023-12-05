import 'package:flutter/material.dart';
import 'package:withtone/app.dart';
import 'package:withtone/splash_page.dart';
import 'package:withtone/upload_inst_page.dart';
import 'package:withtone/views/learning_community_search.dart';
import 'package:withtone/views/pages/%20privacy/privacy_page.dart';
import 'package:withtone/views/pages/account/account_page.dart';
import 'package:withtone/views/pages/account_delete/account_stopdelete_delete_page.dart';
import 'package:withtone/views/pages/account_delete/account_stopdelete_page.dart';
import 'package:withtone/views/pages/account_delete/account_stopdelete_stop_page.dart';
import 'package:withtone/views/pages/article/article_page.dart';
import 'package:withtone/views/pages/edit_profile/edit_profile_page.dart';
import 'package:withtone/views/pages/home_page.dart';
import 'package:withtone/views/pages/intro/intro_page.dart';
import 'package:withtone/views/pages/login_mail/login_mail_page.dart';
import 'package:withtone/views/pages/password_reissue/password_reissue_page.dart';
import 'package:withtone/views/pages/password_reissue_confirm/password_reissue_confirm_page.dart';
import 'package:withtone/views/pages/professional_tool/professional_tool_page.dart';
import 'package:withtone/views/pages/profile/profile_page.dart';
import 'package:withtone/views/pages/register_user/register_user_page.dart';
import 'package:withtone/views/pages/setting/setting_page.dart';
import 'package:withtone/views/pages/signup_mail/signup_mail.dart';
import 'package:withtone/views/pages/upload_commentq/upload_commentq_page.dart';
import 'package:withtone/views/pages/upload_fb.dart';
import 'package:withtone/views/pages/upload_question_fb/upload_comment_fb_page.dart';
import 'package:withtone/views/pages/upload_question_fb/upload_media_fb_page.dart';
import 'package:withtone/views/pages/upload_question_fb/upload_question_fb_page.dart';
import 'package:withtone/views/pages/upload_question_page.dart';
import 'package:withtone/views/pages/upload_video_question/upload_video_question_page.dart';

/// ルーティング管理
/// 基本的にインスタンス化せずに利用します
class Routes {
  /// 初期ページのルート名
  static const String initialRoute = SplashPage.path;

  /// ルーティング一覧
  static final Map<String, Widget Function(BuildContext)> routes = {
    // アプリ起動からホームに遷移するまでの画面
    SplashPage.path: (context) => const SplashPage(),
    IntroPage.path: (context) => const IntroPage(),
    LoginMailPage.path: (context) => const LoginMailPage(),
    SignupMailPage.path: (context) => const SignupMailPage(),
    PasswordReissuePage.path: (context) => const PasswordReissuePage(),
    PasswordReissueConfirmPage.path: (context) =>
        const PasswordReissueConfirmPage(),
    LeaningCommunitySearch.path: (context) => const LeaningCommunitySearch(),

    // ホーム画面
    // routes にないが, HomePage 内部で 5 画面管理している
    // routes で表現した方がわかりやすい? 引数で明示的に渡すことも検討する
    HomePage.path: (context) => HomePage(App.analytics, App.observer),

    // その他の画面
    ProfilePage.path: (context) => const ProfilePage(),
    SettingsPage.path: (context) => const SettingsPage(),
    ProfessionalToolPage.path: (context) => const ProfessionalToolPage(),
    EditProfilePage.path: (context) => const EditProfilePage(),
    AccountPage.path: (context) => const AccountPage(),
    PrivacyPage.path: (context) => const PrivacyPage(),
    UploadFbPage.path: (context) => const UploadFbPage(),
    UploadQuestionFBPage.path: (context) => const UploadQuestionFBPage(),
    UploadCommentFbPage.path: (context) => const UploadCommentFbPage(),
    UploadMediaFbPage.path: (context) => const UploadMediaFbPage(),
    UploadInstPage.path: (context) => const UploadInstPage(),
    UploadQuestionPage.path: (context) => const UploadQuestionPage(),
    UploadCommentqPage.path: (context) => const UploadCommentqPage(),
    UploadVideoQuestionPage.path: (context) => const UploadVideoQuestionPage(),
    ArticlePage.path: (context) => const ArticlePage(),
    AccountStopdeletePage.path: (context) => const AccountStopdeletePage(),
    AccountStopdeleteStopPage.path: (context) =>
        const AccountStopdeleteStopPage(),
    AccountStopdeleteDeletePage.path: (context) =>
        const AccountStopdeleteDeletePage(),
    RegisterUserPage.path: (constext) => const RegisterUserPage()
  };
}
