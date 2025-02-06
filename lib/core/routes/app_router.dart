import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

// dart run build_runner build --delete-conflicting-outputs

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          initial: true,
        )
      ];
}
