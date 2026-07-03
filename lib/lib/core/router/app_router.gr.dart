// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:std_prj/DetailsPage.dart' as _i1;
import 'package:std_prj/Homepage.dart' as _i2;
import 'package:std_prj/lib/features/users/presentation/pages/user_list_page.dart'
    as _i4;
import 'package:std_prj/mypage.dart' as _i3;

/// generated route for
/// [_i1.DetailsScreen]
class DetailsRoute extends _i5.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i6.Key? key,
    required String message,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         DetailsRoute.name,
         args: DetailsRouteArgs(key: key, message: message),
         initialChildren: children,
       );

  static const String name = 'DetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i1.DetailsScreen(key: args.key, message: args.message);
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.message});

  final _i6.Key? key;

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
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.MyPage]
class MyRoute extends _i5.PageRouteInfo<void> {
  const MyRoute({List<_i5.PageRouteInfo>? children})
    : super(MyRoute.name, initialChildren: children);

  static const String name = 'MyRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.MyPage();
    },
  );
}

/// generated route for
/// [_i4.UserListPage]
class UserListRoute extends _i5.PageRouteInfo<void> {
  const UserListRoute({List<_i5.PageRouteInfo>? children})
    : super(UserListRoute.name, initialChildren: children);

  static const String name = 'UserListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.UserListPage();
    },
  );
}
