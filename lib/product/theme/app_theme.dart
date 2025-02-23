import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';

abstract final class AppTheme {
  static ThemeData get getLightTheme => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          titleTextStyle: _ProjectTextStyle.titleMedium,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // Status bar'ı tamamen şeffaf yap
            statusBarBrightness: Brightness.light, // iOS için ikonları açık hale getir
            statusBarIconBrightness: Brightness.dark, // Android için ikonları koyu yap
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize:  Size.fromHeight(50.h))),
        textTheme: const TextTheme(
          titleLarge: _ProjectTextStyle.titleLarge,
          titleMedium: _ProjectTextStyle.titleMedium,
          titleSmall: _ProjectTextStyle.titlesmall,
        ),
      );
}

class _ProjectTextStyle {
  // for big title
  static const titleLarge = TextStyle(
    fontFamily: "Raleway-Black",
    fontSize: 30,
    color: ProjectColors.black,
    fontWeight: FontWeight.w700,
  );
  // for normal title
  static const titleMedium = TextStyle(
    fontFamily: "Raleway-Bold",
    fontSize: 16,
    color: ProjectColors.black,
    fontWeight: FontWeight.w500,
  );
  // for sup title
  static const titlesmall = TextStyle(
    fontFamily: "Raleway-Regular",
    fontSize: 16,
    color: ProjectColors.black,
    fontWeight: FontWeight.w400,
  );
  static const bodyLarge = TextStyle(
    fontFamily: "Raleway-Regular",
    fontSize: 14,
    color: ProjectColors.black,
    fontWeight: FontWeight.w500,
  );
}
