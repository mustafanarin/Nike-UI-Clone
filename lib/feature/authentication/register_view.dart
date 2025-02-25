import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/utility/validators/validators.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';
import 'package:nike_ui_clone/product/widgets/project_textfield.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
              const _NameEmailPasswordTextField(),
              const _SignUpButton(),
              SizedBox(height: 25.h),
              const _SignUpGoogleButton(),
              const Spacer(flex: 2),
              const _CreateAccountRow(),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameEmailPasswordTextField extends StatelessWidget {
  const _NameEmailPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        const _YourNameText(),
        const _TextfieldName(),
        const _EmailText(),
        const _TextFiledEmail(),
        SizedBox(height: 30.h),
        const _PasswordText(),
        const _TexfieldPassword(),
        SizedBox(height: 35.h)
      ],
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
            ProjectStrings.registerTitle,
            style: context.textTheme().titleLarge,
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              ProjectStrings.helloSupTitle,
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

class _YourNameText extends StatelessWidget {
  const _YourNameText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        ProjectStrings.yourName,
        style: context.textTheme().titleMedium,
      ),
    );
  }
}

class _TextfieldName extends StatelessWidget {
  const _TextfieldName();

  @override
  Widget build(BuildContext context) {
    return ProjectTextField(
      hintText: ProjectStrings.nameHint,
      validator: Validators().validateName,
      keyboardType: TextInputType.name,
    );
  }
}

class _EmailText extends StatelessWidget {
  const _EmailText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        ProjectStrings.emailAddress,
        style: context.textTheme().titleMedium,
      ),
    );
  }
}

class _TextFiledEmail extends StatelessWidget {
  const _TextFiledEmail();

  @override
  Widget build(BuildContext context) {
    return ProjectTextField(
      hintText: ProjectStrings.emailHint,
      validator: Validators().validateEmail,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordText extends StatelessWidget {
  const _PasswordText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.w),
      child: Text(
        ProjectStrings.password,
        style: context.textTheme().titleMedium,
      ),
    );
  }
}

class _TexfieldPassword extends StatelessWidget {
  const _TexfieldPassword();

  @override
  Widget build(BuildContext context) {
    return ProjectTextField(
      hintText: ProjectStrings.passwordHint,
      validator: Validators().validatePassword,
      isPassword: true,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return ProjectButton(
        title: ProjectStrings.signUpButton,
        onPressed: () {
          // TODO valide control
        });
  }
}

class _SignUpGoogleButton extends StatelessWidget {
  const _SignUpGoogleButton();

  @override
  Widget build(BuildContext context) {
    return ProjectButton(
      title: ProjectStrings.signUpGoogleButton,
      onPressed: () {},
      isGoogleButton: true,
    );
  }
}

class _CreateAccountRow extends StatelessWidget {
  const _CreateAccountRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ProjectStrings.alreadyAccount,
          style: context.textTheme().titleSmall?.copyWith(color: ProjectColors.dimGray),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          behavior: HitTestBehavior.opaque,
          child: Text(
            ProjectStrings.logIn,
            style: context.textTheme().titleSmall,
          ),
        )
      ],
    );
  }
}
