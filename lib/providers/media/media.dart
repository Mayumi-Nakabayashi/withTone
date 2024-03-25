import 'dart:io';

import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media.g.dart';

/// 撮影した画像や動画を管理する
@riverpod
class MediaNotifier extends _$MediaNotifier {
  @override
  XFile? build() {
    return null;
  }

  /// 更新する
  void update(XFile? media) {
    state = media;
  }

  /// メディアをファイルとして提供する
  File get file {
    final mediaPath = state?.path;
    if (mediaPath == null || mediaPath == '') {
      throw Exception('メディアがありません');
    }
    return File(mediaPath);
  }

  /// メディアが画像かどうか
  bool get isImage {
    return state?.path.endsWith('.jpg') ?? false;
  }
}
