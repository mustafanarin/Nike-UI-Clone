import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/authentication/forgot_password_view.dart';
import 'package:nike_ui_clone/feature/authentication/register_view.dart';
import 'package:nike_ui_clone/feature/home/home_view.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/utility/validators/validators.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';
import 'package:nike_ui_clone/product/widgets/project_textfield.dart';

final class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              const _EmailAndPasswordTextfield(),
              const _RecoveryPasswordText(),
              const _SignInButton(),
              SizedBox(height: 25.h),
              const _SignInGoogleButton(),
              const Spacer(flex: 4),
              const _CreateAccountRowText(),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailAndPasswordTextfield extends StatelessWidget {
  const _EmailAndPasswordTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        const _EmailText(),
        const _TextFiledEmail(),
        SizedBox(height: 30.h),
        const _PasswordText(),
        const _TexfieldPassword(),
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
            ProjectStrings.helloText,
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

class _EmailText extends StatelessWidget {
  const _EmailText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
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

class _RecoveryPasswordText extends StatelessWidget {
  const _RecoveryPasswordText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPasswordView()));
            },
            behavior: HitTestBehavior.opaque,
            child: Text(
              ProjectStrings.recoveryPassword,
              style: context.textTheme().bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return ProjectButton(
        title: ProjectStrings.signInButton,
        onPressed: () {
          // TODO valide control and pushremoveuntil
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
        });
  }
}

class _SignInGoogleButton extends StatelessWidget {
  const _SignInGoogleButton();

  @override
  Widget build(BuildContext context) {
    return ProjectButton(
      title: ProjectStrings.signInGoogleButton,
      onPressed: () {},
      isGoogleButton: true,
    );
  }
}

class _CreateAccountRowText extends StatelessWidget {
  const _CreateAccountRowText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ProjectStrings.newUser,
          style: context.textTheme().titleSmall?.copyWith(color: ProjectColors.dimGray),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterView()));
          },
          behavior: HitTestBehavior.opaque,
          child: Text(
            ProjectStrings.createAccount,
            style: context.textTheme().titleSmall,
          ),
        )
      ],
    );
  }
}
