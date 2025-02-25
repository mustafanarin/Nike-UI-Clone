import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/utility/validators/validators.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';
import 'package:nike_ui_clone/product/widgets/project_textfield.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey();
    return Scaffold(
      backgroundColor: ProjectColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              const _BackIconButton(),
              const _TitleAndSubTitleText(),
              SizedBox(height: 35.h),
              const _ForgotPasswordTextfield(),
              SizedBox(height: 40.h),
              const _ResetPasswordButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _BackIconButton extends StatelessWidget {
  const _BackIconButton();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: const BoxDecoration(
          color: ProjectColors.cultured,
          shape: BoxShape.circle,
        ),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            )));
  }
}

class _TitleAndSubTitleText extends StatelessWidget {
  const _TitleAndSubTitleText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            ProjectStrings.forgotPassword,
            style: context.textTheme().titleLarge,
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              ProjectStrings.forgotPasswordSubTitle,
              style: context.textTheme().titleSmall?.copyWith(
                    color: ProjectColors.auroMetal,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class _ForgotPasswordTextfield extends StatelessWidget {
  const _ForgotPasswordTextfield();

  @override
  Widget build(BuildContext context) {
    return ProjectTextField(
        validator: Validators().validatePassword,
        hintText: ProjectStrings.nameHint,
        keyboardType: TextInputType.visiblePassword);
  }
}

class _ResetPasswordButton extends StatelessWidget {
  const _ResetPasswordButton();

  @override
  Widget build(BuildContext context) {
    return ProjectButton(title: ProjectStrings.resetPassword, onPressed: () {});
  }
}
