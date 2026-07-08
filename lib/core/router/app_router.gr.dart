// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:std_prj/DetailsPage.dart' as _i1;
import 'package:std_prj/features/auth/presentation/pages/launcher_page.dart'
    as _i3;
import 'package:std_prj/features/auth/presentation/pages/login_page.dart'
    as _i4;
import 'package:std_prj/features/users/presentation/pages/user_detail_page.dart'
    as _i6;
import 'package:std_prj/features/users/presentation/pages/user_list_page.dart'
    as _i7;
import 'package:std_prj/Homepage.dart' as _i2;
import 'package:std_prj/mypage.dart' as _i5;

/// generated route for
/// [_i1.DetailsScreen]
class DetailsRoute extends _i8.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i9.Key? key,
    required String message,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         DetailsRoute.name,
         args: DetailsRouteArgs(key: key, message: message),
         initialChildren: children,
       );

  static const String name = 'DetailsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i1.DetailsScreen(key: args.key, message: args.message);
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.message});

  final _i9.Key? key;

  final String message;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, message: $message}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailsRouteArgs) return false;
    return key == other.key && message == other.message;
  }

  @override
  int get hashCode => key.hashCode ^ message.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LauncherPage]
class LauncherRoute extends _i8.PageRouteInfo<void> {
  const LauncherRoute({List<_i8.PageRouteInfo>? children})
    : super(LauncherRoute.name, initialChildren: children);

  static const String name = 'LauncherRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.LauncherPage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.MyPage]
class MyRoute extends _i8.PageRouteInfo<void> {
  const MyRoute({List<_i8.PageRouteInfo>? children})
    : super(MyRoute.name, initialChildren: children);

  static const String name = 'MyRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.MyPage();
    },
  );
}

/// generated route for
/// [_i6.UserDetailPage]
class UserDetailRoute extends _i8.PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    required int userId,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         UserDetailRoute.name,
         args: UserDetailRouteArgs(userId: userId, key: key),
         initialChildren: children,
       );

  static const String name = 'UserDetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserDetailRouteArgs>();
      return _i6.UserDetailPage(userId: args.userId, key: args.key);
    },
  );
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({required this.userId, this.key});

  final int userId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'UserDetailRouteArgs{userId: $userId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserDetailRouteArgs) return false;
    return userId == other.userId && key == other.key;
  }

  @override
  int get hashCode => userId.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i7.UserListPage]
class UserListRoute extends _i8.PageRouteInfo<void> {
  const UserListRoute({List<_i8.PageRouteInfo>? children})
    : super(UserListRoute.name, initialChildren: children);

  static const String name = 'UserListRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.UserListPage();
    },
  );
}
