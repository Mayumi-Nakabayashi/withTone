import 'package:flutter/material.dart';
import 'package:withtone/views/theme/sizes.dart';

/// フォント
class WithtoneFont {
  static const general = 'NotoSansJP';
}

/// 文字スタイル
class WithtoneText {
  static const titleL = TextStyle(
    fontSize: RawSize.p28,
    fontFamily: WithtoneFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleM = TextStyle(
    fontSize: RawSize.p24,
    fontFamily: WithtoneFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleS = TextStyle(
    fontSize: RawSize.p20,
    fontFamily: WithtoneFont.general,
  );
  static const bodyL = TextStyle(
    fontSize: RawSize.p18,
    fontFamily: WithtoneFont.general,
  );
  static const bodyM = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: WithtoneFont.general,
  );
  static const bodyS = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: WithtoneFont.general,
  );
}
