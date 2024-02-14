import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/app.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // runApp 前に　binding する
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase の設定を読み込む
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: App()));
}
