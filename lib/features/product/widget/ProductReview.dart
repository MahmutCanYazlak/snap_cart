import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/features/product/widget/RecipeInfo.dart';

import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../../../config/widget/custom_text/custom_text.dart';
import '../screens/product_detail.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({
    super.key,
    required this.widget,
  });

  final ProductDetail widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.product.reviews.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)]
                      .shade200,
                  child: CustomText(
                    label: widget.product.reviews[index].reviewerName[0],
                  ),
                ),
                SizedBox(
                  width: context.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          label: widget.product.reviews[index].reviewerName,
                          weight: FontWeight.w500,
                          color: AppColors.darkGrayColor,
                        ),
                        SizedBox(
                          width: context.width * 0.02,
                        ),
                        RecipeInfo(
                          imageConstants: ImageConstants.star.getPng,
                          label:
                              widget.product.reviews[index].rating.toString(),
                        ),
                      ],
                    ),
                    CustomText(
                      label: ("(${widget.product.reviews[index].date})"),
                      weight: FontWeight.w400,
                      size: context.width * 0.035,
                      color: AppColors.grayColor,
                    ),
                    CustomText(
                      label: widget.product.reviews[index].comment,
                      weight: FontWeight.w400,
                      color: AppColors.grayColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
          ],
        );
      },
    );
  }
}
