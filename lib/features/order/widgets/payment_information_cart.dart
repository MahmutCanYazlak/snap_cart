import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/features/order/widgets/payment_text.dart';

import '../../../config/items/app_colors.dart';
import '../controller/order_controller.dart';

class PaymentInformationCart extends StatelessWidget {
  const PaymentInformationCart({
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
          right: context.width * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.03,
        vertical: context.height * 0.01,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 184, 160, 241),
            Color.fromARGB(255, 213, 200, 243),
          ], // Başlangıç ve bitiş renklerini tanımlayın
          begin: Alignment.bottomCenter, // Degrade başlangıç yönü
          end: Alignment.topCenter, // Degrade bitiş yönü
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          //SubTotal
          PaymentText(
            prefixText: 'SubTotal: ',
            suffixText:
                "\$${cartController.getTotalPrice().toStringAsFixed(2)}",
          ),
          PaymentText(
            prefixText: 'Tax: ',
            suffixText: '\$$taxesCharges',
          ),
          PaymentText(
            prefixText: 'Discount: ',
            suffixText: "-\$$discount",
          ),

          const Divider(
            color: AppColors.whiteColor,
            thickness: 1,
          ),
          PaymentText(
            prefixText: 'Total Price: ',
            suffixText:
                "\$${(cartController.getTotalPrice() + double.parse(taxesCharges) - double.parse(discount)).toStringAsFixed(2)}",
          ),
        ],
      ),
    );
  }
}
