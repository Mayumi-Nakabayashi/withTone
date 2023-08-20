import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:withtone/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // Firebase analytics 設定
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff005792),
          primary: const Color(0xff005792),
          secondary: const Color(0xffffb921),
        ),
        useMaterial3: true,
      ),
      routes: Routes.routes,
      initialRoute: Routes.initialRoute,
      // Navigator の画面遷移を検出して通知する
      navigatorObservers: <NavigatorObserver>[observer],
    );
  }
}
