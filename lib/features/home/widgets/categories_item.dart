import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';

class CatagoriesItemWidget extends StatelessWidget {
  const CatagoriesItemWidget({
    required this.image,
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key,
  });
  final ImageConstants image;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: context.width * 0.28,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.darkPuple : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  image.getPng,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SvgPicture.asset(
                  ImageConstants.right.getSvg,
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.width * 0.05,
          ),
        ],
      ),
    );
  }
}
