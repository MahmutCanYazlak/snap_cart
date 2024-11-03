import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';
import '../../../config/widget/custom_text/custom_text.dart';

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({
    super.key,
    required this.imageConstants,
    required this.label,
  });
  final String label;
  final String imageConstants;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageConstants,
        ),
        SizedBox(
          width: context.width * 0.02,
        ),
        CustomText(
          label: label,
          weight: FontWeight.w500,
          color: AppColors.darkGrayColor,
        ),
      ],
    );
  }
}
