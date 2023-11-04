import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/design/animation/animated_hide.dart';
import 'package:wms/src/core/design/widget/logo.dart';
import 'package:wms/src/core/route.dart';
import 'package:wms/src/core/utils/extensions/context.dart';

@RoutePage()
class NavbarPage extends StatelessWidget {
  const NavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AutoTabsRouter.tabBar(
        physics: const NeverScrollableScrollPhysics(),
        routes: const [
          HomeRoute(),
          ProductRoute(),
          TransactionRoute(),
          SettingRoute(),
        ],
        builder: (context, child, controller) {
          return Consumer(builder: (context, ref, _) {
            bool isTable = context.isTablet();
            final tabsRouter = AutoTabsRouter.of(context, watch: true);
            void onChange(index) {
              tabsRouter.setActiveIndex(index);
            }

            final items = [
              (title: "Home", icon: Icons.home),
              (title: "Product", icon: Icons.badge),
              (title: "Transaction", icon: Icons.analytics),
              (title: "Setting", icon: Icons.settings),
            ];
            final color = Theme.of(context).colorScheme;
            return Scaffold(
              body: Row(
                children: [
                  Visibility(
                    visible: isTable,
                    child: NavigationRail(
                        leading: Padding(
                          padding: const EdgeInsets.all(8),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: color.onPrimary,
                            child: const AppLogo(
                              size: 90,
                            ),
                          ),
                        ),
                        backgroundColor: color.primary,
                        // ElevationOverlay.applySurfaceTint(
                        //     color.background, color.primary, 10),
                        labelType: NavigationRailLabelType.all,
                        selectedIndex: tabsRouter.activeIndex,
                        onDestinationSelected: onChange,
                        destinations: items
                            .map((e) => NavigationRailDestination(
                                  icon: Icon(e.icon),
                                  label: Text(e.title),
                                ))
                            .toList()),
                  ),
                  Expanded(child: child),
                ],
              ),
              bottomNavigationBar: AnimatedHide(
                show: !isTable,
                child: NavigationBar(
                    selectedIndex: tabsRouter.activeIndex,
                    backgroundColor:
                        Theme.of(context).navigationBarTheme.backgroundColor,
                    onDestinationSelected: onChange,
                    destinations: items
                        .map((e) => NavigationDestination(
                              icon: Icon(e.icon),
                              label: e.title,
                            ))
                        .toList()),
              ),
            );
          });
        },
      ),
    );
  }
}
