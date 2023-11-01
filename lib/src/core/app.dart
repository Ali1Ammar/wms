import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/localization/localization.dart';
import 'package:wms/src/core/design/theme/app_theme.dart';
import 'package:wms/src/core/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final appRouter = ref.watch(appRouterProvider);
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        //route
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        routerConfig: appRouter.config(),
        //theme
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        //localizations
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
      );
    });
  }
}
