// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_ref.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedbackRefHash() => r'04b2671a4e3110b64aae92cc78b9ff00e1c85b3b';

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

abstract class _$FeedbackRef
    extends BuildlessAutoDisposeNotifier<CollectionReference<Feedback>> {
  late final Post post;

  CollectionReference<Feedback> build(
    Post post,
  );
}

/// See also [FeedbackRef].
@ProviderFor(FeedbackRef)
const feedbackRefProvider = FeedbackRefFamily();

/// See also [FeedbackRef].
class FeedbackRefFamily extends Family<CollectionReference<Feedback>> {
  /// See also [FeedbackRef].
  const FeedbackRefFamily();

  /// See also [FeedbackRef].
  FeedbackRefProvider call(
    Post post,
  ) {
    return FeedbackRefProvider(
      post,
    );
  }

  @override
  FeedbackRefProvider getProviderOverride(
    covariant FeedbackRefProvider provider,
  ) {
    return call(
      provider.post,
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
  String? get name => r'feedbackRefProvider';
}

/// See also [FeedbackRef].
class FeedbackRefProvider extends AutoDisposeNotifierProviderImpl<FeedbackRef,
    CollectionReference<Feedback>> {
  /// See also [FeedbackRef].
  FeedbackRefProvider(
    Post post,
  ) : this._internal(
          () => FeedbackRef()..post = post,
          from: feedbackRefProvider,
          name: r'feedbackRefProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackRefHash,
          dependencies: FeedbackRefFamily._dependencies,
          allTransitiveDependencies:
              FeedbackRefFamily._allTransitiveDependencies,
          post: post,
        );

  FeedbackRefProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.post,
  }) : super.internal();

  final Post post;

  @override
  CollectionReference<Feedback> runNotifierBuild(
    covariant FeedbackRef notifier,
  ) {
    return notifier.build(
      post,
    );
  }

  @override
  Override overrideWith(FeedbackRef Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedbackRefProvider._internal(
        () => create()..post = post,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        post: post,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FeedbackRef, CollectionReference<Feedback>>
      createElement() {
    return _FeedbackRefProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackRefProvider && other.post == post;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, post.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbackRefRef
    on AutoDisposeNotifierProviderRef<CollectionReference<Feedback>> {
  /// The parameter `post` of this provider.
  Post get post;
}

class _FeedbackRefProviderElement extends AutoDisposeNotifierProviderElement<
    FeedbackRef, CollectionReference<Feedback>> with FeedbackRefRef {
  _FeedbackRefProviderElement(super.provider);

  @override
  Post get post => (origin as FeedbackRefProvider).post;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
