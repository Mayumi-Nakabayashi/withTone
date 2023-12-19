import 'package:flutter/material.dart';
import 'package:withtone/views/theme/sizes.dart';

/// フォント
class WithToneFont {
  static const general = 'NotoSansJP';
}

/// 文字スタイル
class WithToneText {
  static const titleL = TextStyle(
    fontSize: RawSize.p28,
    fontFamily: WithToneFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleM = TextStyle(
    fontSize: RawSize.p24,
    fontFamily: WithToneFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleS = TextStyle(
    fontSize: RawSize.p20,
    fontFamily: WithToneFont.general,
  );
  static const bodyL = TextStyle(
    fontSize: RawSize.p18,
    fontFamily: WithToneFont.general,
  );
  static const bodyM = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: WithToneFont.general,
  );
  static const bodyS = TextStyle(
    fontSize: RawSize.p14,
    fontFamily: WithToneFont.general,
  );
}
