import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';
import '../../../config/widget/custom_text/custom_text.dart';

class ProductPriceWidget extends StatelessWidget {
  final String originalPrice;
  final double currentPrice;

  const ProductPriceWidget({
    super.key,
    required this.originalPrice,
    required this.currentPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 0,
          top: -23,
          child: Transform.rotate(
            angle: -0.1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(3),
              child: CustomText(
                label: " $originalPrice \$ ",
                color: Colors.red,
                weight: FontWeight.bold,
                textDecoration: TextDecoration.lineThrough,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(3),
          child: CustomText(
            size: context.width * 0.048,
            label: " $currentPrice \$  ",
            weight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
