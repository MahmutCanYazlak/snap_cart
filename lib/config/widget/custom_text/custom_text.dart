import 'package:flutter/material.dart';

import '../../items/app_colors.dart';

class CustomText extends StatefulWidget {
  const CustomText({
    super.key,
    this.size,
    required this.label,
    this.weight,
    this.color,
    this.textAlign,
    this.textDecoration,
    this.bottomPadding = 0,
  });
  final double? size;
  final String label;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final double? bottomPadding;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            decoration: widget.textDecoration ?? TextDecoration.none,
            fontFamily: "Gilroy-Semibold",
            fontSize: widget.size ?? 18,
            fontWeight: widget.weight ?? FontWeight.w700,
            color: widget.color ?? AppColors.blackColor,
          ),
          textAlign: widget.textAlign ?? TextAlign.center,
        ),
        widget.bottomPadding != 0
            ? SizedBox(
                height: widget.bottomPadding,
              )
            : const SizedBox(),
      ],
    );
  }
}
