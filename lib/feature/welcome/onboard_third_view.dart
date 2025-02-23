import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/enum/png_onboard_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';

class OnboardThirdView extends StatelessWidget {
  const OnboardThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ProjectColors.cyanBlue,
      body: Stack(
        children: [
          _TopDecoration(),
          _ShoeImage(),
          _NikeLogo(),
          _TitleAndSubtitle(),
          _NextButton(),
        ],
      ),
    );
  }
}

class _TopDecoration extends StatelessWidget {
  const _TopDecoration();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80.h,
      left: 50.w,
      child: Image.asset(
        PngOnboardPath.smile2.path,
      ),
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
          top: 30.h,
          left: 0.w,
          child: Image.asset(
            PngOnboardPath.shoe2.path,
          ),
        ),
        Positioned(
          top: 150.h,
          left: 30.w,
          child: Image.asset(
            PngOnboardPath.pageShush3.path,
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

class _TitleAndSubtitle extends StatelessWidget {
  const _TitleAndSubtitle();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 450.h,
          left: 50.w,
          right: 50.w,
          child: Text(
            ProjectStrings.onboard3Title,
            style: context.textTheme().titleLarge?.copyWith(fontSize: 34, color: ProjectColors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 550.h,
          left: 50.w,
          right: 50.w,
          child: Text(
            ProjectStrings.onboard3SubTitle,
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
        bottom: 40.h,
        left: 20.w,
        right: 20.w,
        child: const ProjectButton(
          title: ProjectStrings.onboard1Button,
        ));
  }
}
