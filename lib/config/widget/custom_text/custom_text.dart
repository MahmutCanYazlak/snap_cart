import 'package:flutter/material.dart';

import '../../items/app_colors.dart';

class CustomText extends StatefulWidget {
  const CustomText({
    super.key,
    this.size,
    required this.label,
    this.weight,
    this.color,
  });
  final double? size;
  final String label;
  final FontWeight? weight;
  final Color? color;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.label,
      style: TextStyle(
        fontFamily: "Gilroy-Semibold",
        fontSize: widget.size ?? 18,
        fontWeight: widget.weight ?? FontWeight.w700,
        color: widget.color ?? AppColors.blackColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
