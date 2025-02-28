import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nike_ui_clone/feature/welcome/onboardings.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Onboardings()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.brandeisBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              PngGeneralPath.logo.path,
            ),
            Text(
              ProjectStrings.nike,
              style: context.textTheme().titleLarge?.copyWith(color: ProjectColors.white, fontSize: 65),
            ),
          ],
        ),
      ),
    );
  }
}
