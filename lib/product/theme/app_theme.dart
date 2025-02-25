import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';

abstract final class AppTheme {
  static ThemeData get getLightTheme => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          titleTextStyle: _ProjectTextStyle.titleMedium,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: _ProjectTextStyle.bodyLarge.copyWith(
            color: ProjectColors.dimGray.withOpacity(0.6),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: ProjectColors.cultured,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size.fromHeight(50.h))),
        textTheme: const TextTheme(
            titleLarge: _ProjectTextStyle.titleLarge,
            titleMedium: _ProjectTextStyle.titleMedium,
            titleSmall: _ProjectTextStyle.titlesmall,
            bodyLarge: _ProjectTextStyle.bodyLarge,
            bodyMedium: _ProjectTextStyle.bodyMedium),
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
    fontWeight: FontWeight.w400,
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
  static const bodyMedium = TextStyle(
    fontFamily: "Raleway-Regular",
    fontSize: 12,
    color: ProjectColors.auroMetal,
    fontWeight: FontWeight.w400,
  );
}
