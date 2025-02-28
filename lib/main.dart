import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/welcome/splash_view.dart';
import 'package:nike_ui_clone/product/theme/app_theme.dart';
import 'package:nike_ui_clone/product/utility/initializer/app_initializer.dart';

Future<void> main() async {
  await AppInitializer.initialize();

  runApp(
    AppInitializer.initializeApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 808),
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getLightTheme,
          title: 'Nike',
          home: const SplashView(),
        );
      },
    );
  }
}
