import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart'; // generated file code

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // '/' കൊടുത്താൽ ആപ്പ് തുടങ്ങുമ്പോൾ കാണിക്കുന്ന ആദ്യ സ്ക്രീൻ (Initial screen) ഇതായിരിക്കും
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: DetailsRoute.page, path: '/details'),
    AutoRoute(path: '/my-page', page: MyRoute.page),
    AutoRoute(path: '/user_list', page: UserListRoute.page),
    AutoRoute(path: '/user_details', page: UserDetailRoute.page),
  ];
}
