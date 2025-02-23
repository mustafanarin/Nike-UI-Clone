import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/enum/png_onboard_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';

class OnboardSecondView extends StatelessWidget {
  const OnboardSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ProjectColors.cyanBlue,
      body: Stack(
        children: [
          _TopDecorations(),
          _ShoeImage(),
          _NikeLogo(),
          _TitleAndSubTitle(),
          _NextButton(),
        ],
      ),
    );
  }
}

class _TopDecorations extends StatelessWidget {
  const _TopDecorations();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80.h,
          left: 40.w,
          child: Image.asset(
            PngOnboardPath.pageShush2.path,
          ),
        ),
        Positioned(
          top: 80.h,
          left: 300.w,
          child: Image.asset(
            PngOnboardPath.smile1.path,
          ),
        ),
      ],
    );
  }
}

class _ShoeImage extends StatelessWidget {
  const _ShoeImage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 110.h,
          left: 0.w,
          child: Image.asset(
            PngOnboardPath.shoe1.path,
          ),
        ),
        Positioned(
          top: 370.h,
          left: 40.w,
          child: Image.asset(
            PngOnboardPath.footShadow2.path,
          ),
        ),
      ],
    );
  }
}

class _NikeLogo extends StatelessWidget {
  const _NikeLogo();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 360.h,
      left: 0.w,
      child: Image.asset(
        PngOnboardPath.bigLogo.path,
        width: 400.w,
        height: 300.h,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _TitleAndSubTitle extends StatelessWidget {
  const _TitleAndSubTitle();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 450.h,
          left: 40.w,
          right: 40.w,
          child: Text(
            ProjectStrings.onboard2Title,
            style: context.textTheme().titleLarge?.copyWith(fontSize: 34, color: ProjectColors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 550.h,
          left: 50.w,
          right: 50.w,
          child: Text(
            ProjectStrings.onboard2SubTitle,
            style: context.textTheme().titleSmall?.copyWith(color: ProjectColors.lightSilver),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30.h,
        left: 20.w,
        right: 20.w,
        child: const ProjectButton(
          title: ProjectStrings.onboard1Button,
        ));
  }
}
