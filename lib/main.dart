import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/constants/constants.dart';
import 'package:protfolio/provider/theme_model.dart';
import 'package:protfolio/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeModel>(create: (context) => ThemeModel()),
        ],
        child: Builder(builder: (context) {
          BuildContext rootContext = context;
          return MaterialApp(
            navigatorKey: GlobalContext.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeModel>(rootContext).isDark
                ? ThemeData.dark()
                : ThemeData.light(),
            initialRoute: Routes.mainSection,
            routes: Routes.getRoutes(context),
          );
        }),
      ),
    );
  }
}
