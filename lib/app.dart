import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/providers/camera/camera.dart';
import 'package:withtone/routes.dart';
import 'package:withtone/views/theme/fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  // Firebase analytics 設定
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // 画面遷移を監視して screen_view を送信する
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return _EagerInitialization(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff005792),
            primary: const Color(0xff005792),
            secondary: const Color(0xffffb921),
          ),
          fontFamily: WithToneText.bodyS.fontFamily,
          useMaterial3: true,
        ),
        routes: Routes.routes,
        initialRoute: Routes.initialRoute,
        // Navigator の画面遷移を検出して通知する
        navigatorObservers: <NavigatorObserver>[observer],
      ),
    );
  }
}

/// プロバイダを起動時に初期化する
///
/// https://riverpod.dev/ja/docs/essentials/eager_initialization
class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.

    // デバイスのカメラ情報を取得する
    ref.watch(deviceCamerasProvider);

    log("_EagerInitialization");

    return child;
  }
}
