import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';
import '../controller/order_controller.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
    required this.cartController,
    required this.taxesCharges,
    required this.discount,
  });

  final OrderController cartController;
  final String taxesCharges;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: context.height * 0.02,
        left: context.width * 0.02,
        right: context.width * 0.02,
      ),
      child: Padding(
        padding: context.paddingVerticalLow,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.03,
                    vertical: context.height * 0.015,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xafece6f9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    '\$${(cartController.getTotalPrice() + double.parse(taxesCharges) - double.parse(discount)).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.05,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.03,
                    vertical: context.height * 0.015,
                  ),
                  decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: Text(
                    'Make Payment',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.05,
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}