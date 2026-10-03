import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:protfolio/configs/theme_preferences.dart';
import 'package:protfolio/provider/theme_model.dart';
import 'package:protfolio/sections/main/main_section.dart';
import 'package:protfolio/theme/app_theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
      create: (_) => ThemeModel(const ThemePreferences())..load(),
      child: Consumer<ThemeModel>(
        builder: (BuildContext context, ThemeModel theme, Widget? child) {
          return MaterialApp(
            title: 'Pardeep Kumar | Flutter & Backend Engineer',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: theme.themeMode,
            scrollBehavior: const AppScrollBehavior(),
            home: const MainPage(),
          );
        },
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}
