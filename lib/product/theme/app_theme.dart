import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';

abstract final class AppTheme {
  static ThemeData get getLightTheme => ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          titleTextStyle: _ProjectTextStyle.titleMedium,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
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
        textTheme: TextTheme(
            titleLarge: _ProjectTextStyle.titleLarge,
            titleMedium: _ProjectTextStyle.titleMedium,
            titleSmall: _ProjectTextStyle.titlesmall,
            bodyLarge: _ProjectTextStyle.bodyLarge,
            bodyMedium: _ProjectTextStyle.bodyMedium),
      );
}

class _ProjectTextStyle {
  // for big title
  static final titleLarge = TextStyle(
    fontFamily: "Raleway-Black",
    fontSize: 30.sp,
    color: ProjectColors.black,
    fontWeight: FontWeight.w700,
  );
  // for normal title
  static final titleMedium = TextStyle(
    fontFamily: "Raleway-Bold",
    fontSize: 16.sp,
    color: ProjectColors.black,
    fontWeight: FontWeight.w500,
  );
  // for sup title
  static final titlesmall = TextStyle(
    fontFamily: "Raleway-Regular",
    fontSize: 16.sp,
    color: ProjectColors.black,
    fontWeight: FontWeight.w400,
  );
  static final bodyLarge = TextStyle(
    fontFamily: "Raleway-Regular",
    fontSize: 14.sp,
    color: ProjectColors.black,
    fontWeight: FontWeight.w500,
  );
  static final bodyMedium = TextStyle(
    fontFamily: "Raleway-Regular",
    fontSize: 12.sp,
    color: ProjectColors.auroMetal,
    fontWeight: FontWeight.w500,
  );
}
