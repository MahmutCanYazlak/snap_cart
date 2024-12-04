import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';
import '../../../config/widget/button/custom_square_button.dart';
import '../../../config/widget/custom_text/custom_text.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSquareButton(
          widget: const CustomText(
            label: "-",
          ),
          width: context.width * 0.08,
          color: AppColors.whiteColor,
          onPressed: onDecrease,
        ),
        SizedBox(
          width: context.width * 0.09,
          child: CustomText(
            label: "$quantity",
          ),
        ),
        CustomSquareButton(
          widget: const CustomText(
            label: "+",
          ),
          width: context.width * 0.08,
          isSelected: true,
          color: AppColors.primary,
          onPressed: onIncrease,
        ),
      ],
    );
  }
}
