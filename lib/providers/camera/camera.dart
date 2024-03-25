import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera.g.dart';

/// 端末で利用可能なカメラの一覧を取得する
@riverpod
Future<List<CameraDescription>> deviceCameras(
  DeviceCamerasRef ref,
) async {
  return await availableCameras();
}

//// カメラを取得する
@riverpod
CameraDescription? selectedCamera(
  SelectedCameraRef ref, {
  CameraLensDirection direction = CameraLensDirection.front,
}) {
  switch (ref.watch(deviceCamerasProvider)) {
    case AsyncData(:final value):
      return value.firstWhere((element) => element.lensDirection == direction);
    default:
      return null;
  }
}
