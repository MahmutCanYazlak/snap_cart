import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../core/models/getMethods/products/get_alll_products.dart';
import '../../../core/models/order/cart_item_model.dart';
import '../../product/widget/quantity_selector.dart';

class CartItemList extends StatelessWidget {
  final List<dynamic> groupedCartItems;
  final Function(CartItemModel) onIncrease;
  final Function(CartItemModel) onDecrease;
  final Function(Product) onProductTap;

  const CartItemList({
    super.key,
    required this.groupedCartItems,
    required this.onIncrease,
    required this.onDecrease,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * 0.02,
      ),
      height: groupedCartItems.length > 3 ? context.height * 0.42 : null,
      decoration: BoxDecoration(
        color: const Color(0xafece6f9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // İçeriğe göre boyutlanma
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true, // Liste boyutu kadar alan kaplar
                physics: const NeverScrollableScrollPhysics(),
                itemCount: groupedCartItems.length,
                itemBuilder: (context, index) {
                  final item = groupedCartItems[index];
                  return InkWell(
                    onTap: () => onProductTap(item['product']),
                    child: ListTile(
                      leading: Image.network(
                        item['product'].images.first,
                        fit: BoxFit.cover,
                        width: context.width * 0.17,
                        height: context.height * 0.07,
                      ),
                      title: Text(
                        item['product'].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.width * 0.04,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          QuantitySelector(
                            quantity: item['quantity'],
                            onIncrease: () => onIncrease(
                              CartItemModel(
                                product: item['product'] as Product,
                                quantity: 1,
                              ),
                            ),
                            onDecrease: () => onDecrease(
                              CartItemModel(
                                product: item['product'] as Product,
                                quantity: item['quantity'],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Price: \$${((item['product'].price) * (item['quantity'])).toStringAsFixed(2)}',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
