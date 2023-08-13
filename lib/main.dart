import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:withtone/app.dart';

void main() async {
  // runApp 前に binding を呼び出す
  WidgetsFlutterBinding.ensureInitialized();

  // firebase 設定
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}
