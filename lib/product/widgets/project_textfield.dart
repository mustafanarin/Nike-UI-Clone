import 'package:flutter/material.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';

class ProjectTextField extends StatefulWidget {
  const ProjectTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.isPassword = false,
    this.obscuringCharacter = '●',
    this.suffixIcon,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
    this.textStyle,
    this.controller,
    this.onChanged,
    required this.keyboardType,
    this.prefixIcon,
    this.filled,
    this.fillColor,
  });

  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String obscuringCharacter;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final AutovalidateMode autovalidateMode;
  final TextStyle? textStyle;
  final TextInputType keyboardType;
  final bool? filled;
  final Color? fillColor;

  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<ProjectTextField> createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      obscureText: _obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      style: widget.textStyle ??
          context.textTheme().bodyLarge?.copyWith(
                color: ProjectColors.black.withOpacity(0.7),
              ),
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: _obscureText
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          key: ValueKey('visibility_off'),
                          size: 20,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          key: ValueKey('visibility'),
                          size: 20,
                        ),
                ),
              )
            : widget.suffixIcon,
      ),
    );
  }
}
