import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    _setSystemUIOverlayStyle();
  }

  static void _setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }

  static Widget initializeApp(Widget app) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: app,
    );
  }
}