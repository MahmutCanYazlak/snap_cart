import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';

class PaymentText extends StatelessWidget {
  const PaymentText({
    super.key,
    required this.prefixText,
    required this.suffixText,
  });

  final String prefixText;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: context.paddingVerticalLow,
          child: Text(
            prefixText,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: context.width * 0.04,
            ),
          ),
        ),
        const Spacer(),
        Text(
          suffixText,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: context.width * 0.04,
          ),
        ),
      ],
    );
  }
}
