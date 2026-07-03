import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

// Extends AutoRouterObserver
class ScreenTrackingObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log("User navigated to screen: ${route.settings.name}");
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log("User navigated back from screen: ${route.settings.name}");
    super.didPop(route, previousRoute);
  }
}
