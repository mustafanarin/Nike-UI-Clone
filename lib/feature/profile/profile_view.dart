import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/navbar/navbar_view.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.white,
      appBar: const _CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _UserProfilePhoto(),
            const _UserInfoColumn(),
            ProjectButton(title: ProjectStrings.saveNow, onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.white,
      title: Text(
        ProjectStrings.profile,
        style: context.textTheme().titleMedium?.copyWith(fontSize: 20),
      ),
      leading: Container(
        margin: EdgeInsets.only(left: 10.w),
        decoration: const BoxDecoration(color: ProjectColors.cultured, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const BottomNavBar()),
              (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      actions: const [_LanguageSelector()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: context.locale.languageCode,
        icon: const Icon(Icons.language),
        elevation: 16,
        style:  context.textTheme().bodyLarge,
        underline: Container(
          height: 2,
          color: ProjectColors.black,
        ),
        onChanged: (String? newValue) {
          if (newValue != null) {
            context.setLocale(Locale(newValue));
          }
        },
        items: context.supportedLocales.map<DropdownMenuItem<String>>((Locale locale) {
          return DropdownMenuItem<String>(
            value: locale.languageCode,
            child: Text(_getLanguageName(locale.languageCode)),
          );
        }).toList(),
      ),
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'tr':
        return 'Türkçe';
      default:
        return languageCode;
    }
  }
}

class _UserProfilePhoto extends StatelessWidget {
  const _UserProfilePhoto();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Image.asset(height: 100.h, width: 100.w, PngGeneralPath.profilePhoto.path)),
        Positioned(
          left: 190.w,
          top: 75.h,
          child: Container(
              height: 18.h,
              width: 18.w,
              decoration: const BoxDecoration(color: ProjectColors.brandeisBlue, shape: BoxShape.circle),
              child: IconButton(
                  padding: EdgeInsets.only(right: 1.w),
                  iconSize: 10,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: ProjectColors.white,
                  ))),
        )
      ],
    );
  }
}

class _UserInfoColumn extends StatelessWidget {
  const _UserInfoColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _UserInfoContainer(
          containerTitle: ProjectStrings.yourName,
          value: ProjectStrings.userName,
        ),
        _UserInfoContainer(containerTitle: ProjectStrings.emailAddress, value: ProjectStrings.userEmail),
        SizedBox(
          height: 24.h,
        ),
        _UserInfoContainer(
          containerTitle: ProjectStrings.password,
          value: ProjectStrings.passwordHint,
          isPasswrod: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text(ProjectStrings.recoveryPassword, style: context.textTheme().bodyMedium)],
        ),
        SizedBox(
          height: 35.h,
        ),
      ],
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({required this.containerTitle, required this.value, this.isPasswrod = false});
  final String containerTitle;
  final String value;
  final bool isPasswrod;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          containerTitle,
          style: context.textTheme().titleMedium?.copyWith(color: ProjectColors.auroMetal),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ProjectColors.cultured,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              value,
              style: isPasswrod
                  ? context.textTheme().bodyLarge?.copyWith(color: ProjectColors.auroMetal)
                  : context.textTheme().bodyLarge,
            ),
          ),
        )
      ],
    );
  }
}
