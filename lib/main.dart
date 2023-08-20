import 'dart:async';

import 'package:flutter/material.dart';
import 'package:withtone/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // runApp 前に　binding する
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase の設定を読み込む
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
