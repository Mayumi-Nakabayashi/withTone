import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6759177008690654/3746159611';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6759177008690654/3746159611';
    } else {
      // ignore: unnecessary_new
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
