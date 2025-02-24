import 'package:flutter/material.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/extensions/context_extension.dart';

class ProjectButton extends StatelessWidget {
  const ProjectButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgraoundColor = ProjectColors.brandeisBlue,
  });
  final String title;
  final VoidCallback onPressed;
  final Color backgraoundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgraoundColor),
        onPressed: onPressed,
        child: Text(
          title,
          style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.black),
        ));
  }
}
