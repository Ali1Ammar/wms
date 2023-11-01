import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/presentation/auth/page/login_page.dart';
import 'package:wms/src/presentation/home/page/home_page.dart';
import 'package:wms/src/presentation/shared/navbar/navbar_page.dart';

part 'route.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: NavbarRoute.page, children: [
      AutoRoute(page: HomeRoute.page, initial: true),
    ])
  ];
}
