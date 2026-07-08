// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDetailNotifierHash() =>
    r'aba4ad3e55c99dc7c37c798162ffcc263a8e6bb6';

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

abstract class _$UserDetailNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<UserDetailEntity>> {
  late final int userId;

  AsyncValue<UserDetailEntity> build(int userId);
}

/// See also [UserDetailNotifier].
@ProviderFor(UserDetailNotifier)
const userDetailNotifierProvider = UserDetailNotifierFamily();

/// See also [UserDetailNotifier].
class UserDetailNotifierFamily extends Family<AsyncValue<UserDetailEntity>> {
  /// See also [UserDetailNotifier].
  const UserDetailNotifierFamily();

  /// See also [UserDetailNotifier].
  UserDetailNotifierProvider call(int userId) {
    return UserDetailNotifierProvider(userId);
  }

  @override
  UserDetailNotifierProvider getProviderOverride(
    covariant UserDetailNotifierProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userDetailNotifierProvider';
}

/// See also [UserDetailNotifier].
class UserDetailNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          UserDetailNotifier,
          AsyncValue<UserDetailEntity>
        > {
  /// See also [UserDetailNotifier].
  UserDetailNotifierProvider(int userId)
    : this._internal(
        () => UserDetailNotifier()..userId = userId,
        from: userDetailNotifierProvider,
        name: r'userDetailNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userDetailNotifierHash,
        dependencies: UserDetailNotifierFamily._dependencies,
        allTransitiveDependencies:
            UserDetailNotifierFamily._allTransitiveDependencies,
        userId: userId,
      );

  UserDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  AsyncValue<UserDetailEntity> runNotifierBuild(
    covariant UserDetailNotifier notifier,
  ) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(UserDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserDetailNotifierProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    UserDetailNotifier,
    AsyncValue<UserDetailEntity>
  >
  createElement() {
    return _UserDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDetailNotifierProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserDetailNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<UserDetailEntity>> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _UserDetailNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          UserDetailNotifier,
          AsyncValue<UserDetailEntity>
        >
    with UserDetailNotifierRef {
  _UserDetailNotifierProviderElement(super.provider);

  @override
  int get userId => (origin as UserDetailNotifierProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
