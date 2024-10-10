import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';


class CustomSquareButton extends StatelessWidget {
  const CustomSquareButton({
    super.key,
    required this.widget,
    required this.width,
    this.color,
    this.onPressed,
    this.isSelected,
  });

  final Widget widget;
  final double width;
  final Color? color;
  final Function()? onPressed;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalLow,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: (isSelected ?? false ? color : Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.center,
            child: widget,
          ),
        ),
      ),
    );
  }
}
