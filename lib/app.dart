import 'package:flutter/material.dart';
import 'package:withtone/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
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
    );
  }
}
