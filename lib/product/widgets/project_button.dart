import 'package:flutter/material.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';

class ProjectButton extends StatelessWidget {
  const ProjectButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = ProjectColors.brandeisBlue,
    this.isGoogleButton = false,
  });

  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool isGoogleButton;

  @override
  Widget build(BuildContext context) {
    if (isGoogleButton) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: ProjectColors.cultured),
        onPressed: onPressed,
        icon: Image.asset(PngGeneralPath.googleIcon.path),
        label: Text(
          title,
          style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.black),
        ),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Text(
        title,
        style: context.textTheme().bodyLarge?.copyWith(
            color: (backgroundColor == ProjectColors.brandeisBlue) ? ProjectColors.white : ProjectColors.black),
      ),
    );
  }
}
