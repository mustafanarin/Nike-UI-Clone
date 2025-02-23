import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/welcome/onboardings.dart';
import 'package:nike_ui_clone/product/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Status bar'ı tam transparan yap
    statusBarIconBrightness: Brightness.light, // Android için ikonları açık yap
    statusBarBrightness: Brightness.dark, // iOS için ikonları koyu yap
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 808),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getLightTheme,
          title: 'Material App',
          home: const Onboardings(),
        );
      },
    );
  }
}
