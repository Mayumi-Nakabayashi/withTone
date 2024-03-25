// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceCamerasHash() => r'b11683b2296c9381eef84160b3d1420388a60f96';

/// 端末で利用可能なカメラの一覧を取得する
///
/// Copied from [deviceCameras].
@ProviderFor(deviceCameras)
final deviceCamerasProvider =
    AutoDisposeFutureProvider<List<CameraDescription>>.internal(
  deviceCameras,
  name: r'deviceCamerasProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceCamerasHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceCamerasRef
    = AutoDisposeFutureProviderRef<List<CameraDescription>>;
String _$selectedCameraHash() => r'ad137557f4d2076c513001c9ebe844a3c742b760';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

//// カメラを取得する
///
/// Copied from [selectedCamera].
@ProviderFor(selectedCamera)
const selectedCameraProvider = SelectedCameraFamily();

//// カメラを取得する
///
/// Copied from [selectedCamera].
class SelectedCameraFamily extends Family<CameraDescription?> {
  //// カメラを取得する
  ///
  /// Copied from [selectedCamera].
  const SelectedCameraFamily();

  //// カメラを取得する
  ///
  /// Copied from [selectedCamera].
  SelectedCameraProvider call({
    CameraLensDirection direction = CameraLensDirection.front,
  }) {
    return SelectedCameraProvider(
      direction: direction,
    );
  }

  @override
  SelectedCameraProvider getProviderOverride(
    covariant SelectedCameraProvider provider,
  ) {
    return call(
      direction: provider.direction,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedCameraProvider';
}

//// カメラを取得する
///
/// Copied from [selectedCamera].
class SelectedCameraProvider extends AutoDisposeProvider<CameraDescription?> {
  //// カメラを取得する
  ///
  /// Copied from [selectedCamera].
  SelectedCameraProvider({
    CameraLensDirection direction = CameraLensDirection.front,
  }) : this._internal(
          (ref) => selectedCamera(
            ref as SelectedCameraRef,
            direction: direction,
          ),
          from: selectedCameraProvider,
          name: r'selectedCameraProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedCameraHash,
          dependencies: SelectedCameraFamily._dependencies,
          allTransitiveDependencies:
              SelectedCameraFamily._allTransitiveDependencies,
          direction: direction,
        );

  SelectedCameraProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.direction,
  }) : super.internal();

  final CameraLensDirection direction;

  @override
  Override overrideWith(
    CameraDescription? Function(SelectedCameraRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedCameraProvider._internal(
        (ref) => create(ref as SelectedCameraRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        direction: direction,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<CameraDescription?> createElement() {
    return _SelectedCameraProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedCameraProvider && other.direction == direction;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, direction.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedCameraRef on AutoDisposeProviderRef<CameraDescription?> {
  /// The parameter `direction` of this provider.
  CameraLensDirection get direction;
}

class _SelectedCameraProviderElement
    extends AutoDisposeProviderElement<CameraDescription?>
    with SelectedCameraRef {
  _SelectedCameraProviderElement(super.provider);

  @override
  CameraLensDirection get direction =>
      (origin as SelectedCameraProvider).direction;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
