import 'package:flutter/material.dart';

import '../../items/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController emailController,
    required this.labelText,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightGrayColor,
          labelText: labelText,
          border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }
}
