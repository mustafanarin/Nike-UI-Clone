import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/enum/png_onboard_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';

class OnboardFirstView extends StatelessWidget {
  const OnboardFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ProjectColors.cyanBlue,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _TopDecorations(),
          _FootImage(),
          _NikeLogo(),
          _GetStartedButton(),
        ],
      ),
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton();

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

class _TopDecorations extends StatelessWidget {
  const _TopDecorations();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80.h,
          left: 80.w,
          child: Image.asset(
            PngOnboardPath.titleShush1.path,
          ),
        ),
        Positioned(
          top: 100.h,
          left: 100.w,
          child: Text(
            ProjectStrings.onboard1Title,
            style: context.textTheme().titleLarge?.copyWith(fontWeight: FontWeight.w800, color: ProjectColors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 200.h,
          left: 130.w,
          child: Image.asset(
            PngOnboardPath.titleShush2.path,
          ),
        ),
        Positioned(
          top: 180.h,
          left: 50.w,
          child: Image.asset(
            PngOnboardPath.pageShush1.path,
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

class _FootImage extends StatelessWidget {
  const _FootImage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80.h,
          left: 20.w,
          child: Image.asset(
            PngOnboardPath.foot.path,
          ),
        ),
        Positioned(
          top: 520.h,
          left: 60.w,
          child: Image.asset(
            PngOnboardPath.footShadow1.path,
          ),
        ),
      ],
    );
  }
}
