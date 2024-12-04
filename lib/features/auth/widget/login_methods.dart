import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';

class LoginMethods extends StatelessWidget {
  const LoginMethods({
    super.key,
    required this.labelText,
    required this.image,
  });

  final String labelText;
  final ImageConstants image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrayColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  image.getPng,
                  width: context.width * 0.05,
                  height: context.height * 0.05,
                ),
                Text(
                  labelText,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.darkGrayColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
