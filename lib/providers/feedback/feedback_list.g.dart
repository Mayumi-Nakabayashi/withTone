// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedbackListHash() => r'd62a6d3c53051629b5ae9abf5bf1e936127c4284';

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

abstract class _$FeedbackList
    extends BuildlessAutoDisposeAsyncNotifier<List<Feedback>> {
  late final Post post;

  FutureOr<List<Feedback>> build(
    Post post,
  );
}

/// See also [FeedbackList].
@ProviderFor(FeedbackList)
const feedbackListProvider = FeedbackListFamily();

/// See also [FeedbackList].
class FeedbackListFamily extends Family<AsyncValue<List<Feedback>>> {
  /// See also [FeedbackList].
  const FeedbackListFamily();

  /// See also [FeedbackList].
  FeedbackListProvider call(
    Post post,
  ) {
    return FeedbackListProvider(
      post,
    );
  }

  @override
  FeedbackListProvider getProviderOverride(
    covariant FeedbackListProvider provider,
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
  String? get name => r'feedbackListProvider';
}

/// See also [FeedbackList].
class FeedbackListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FeedbackList, List<Feedback>> {
  /// See also [FeedbackList].
  FeedbackListProvider(
    Post post,
  ) : this._internal(
          () => FeedbackList()..post = post,
          from: feedbackListProvider,
          name: r'feedbackListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackListHash,
          dependencies: FeedbackListFamily._dependencies,
          allTransitiveDependencies:
              FeedbackListFamily._allTransitiveDependencies,
          post: post,
        );

  FeedbackListProvider._internal(
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
  FutureOr<List<Feedback>> runNotifierBuild(
    covariant FeedbackList notifier,
  ) {
    return notifier.build(
      post,
    );
  }

  @override
  Override overrideWith(FeedbackList Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedbackListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FeedbackList, List<Feedback>>
      createElement() {
    return _FeedbackListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackListProvider && other.post == post;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, post.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbackListRef on AutoDisposeAsyncNotifierProviderRef<List<Feedback>> {
  /// The parameter `post` of this provider.
  Post get post;
}

class _FeedbackListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FeedbackList,
        List<Feedback>> with FeedbackListRef {
  _FeedbackListProviderElement(super.provider);

  @override
  Post get post => (origin as FeedbackListProvider).post;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
