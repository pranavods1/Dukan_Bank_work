// lib/core/router/app_router.dart ഫയലിൽ വരുത്തേണ്ട മാറ്റങ്ങൾ:

import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart'; // generated file code

// lib/core/router/app_router.dart ഫയലിൽ വരുത്തേണ്ട മാറ്റങ്ങൾ:

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // ➔ ആപ്പ് തുടങ്ങുമ്പോൾ ആദ്യം LauncherPage ലോഡ് ചെയ്യും ('/' path)
    AutoRoute(page: LauncherRoute.page, path: '/'),

    // ലോഗിൻ സ്ക്രീൻ റൂട്ട്
    AutoRoute(page: LoginRoute.page, path: '/login'),

    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: DetailsRoute.page, path: '/details'),
    AutoRoute(path: '/my-page', page: MyRoute.page),
    AutoRoute(path: '/user_list', page: UserListRoute.page),
    AutoRoute(path: '/user_details', page: UserDetailRoute.page),
  ];
}
