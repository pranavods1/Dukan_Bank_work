import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

// AutoRouterObserver എക്സ്റ്റൻഡ് ചെയ്യുന്നു
class ScreenTrackingObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log("യൂസർ ഈ സ്ക്രീനിലേക്ക് വന്നു: ${route.settings.name}");
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {

    log("യൂസർ ഈ സ്ക്രീനിൽ നിന്ന് ബാക്ക് പോയി: ${route.settings.name}");
    super.didPop(route, previousRoute);
  }
}
