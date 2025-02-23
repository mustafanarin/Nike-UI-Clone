import 'package:flutter/material.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/extensions/context_extension.dart';

class ProjectButton extends StatelessWidget {
  const ProjectButton({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          title,
          style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.black),
        ));
  }
}
