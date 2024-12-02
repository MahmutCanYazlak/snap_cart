import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/features/order/controller/order_controller.dart';

import '../../../config/utility/enum/image_constants.dart';

class OrderDetails extends ConsumerStatefulWidget {
  const OrderDetails({super.key});

  @override
  ConsumerState<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends ConsumerState<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    final cartController = ref.watch(orderControllerProvider);
    final cartItems = cartController.getCartItems();

    // Ürünleri gruplama işlemi
    final Map<String, dynamic> groupedItems = {};
    for (var item in cartItems) {
      final productId = item.product.id.toString();
      if (groupedItems.containsKey(productId)) {
        groupedItems[productId]['quantity'] += 1;
        groupedItems[productId]['totalPrice'] =
            groupedItems[productId]['quantity'] * item.product.price;
      } else {
        groupedItems[productId] = {
          'product': item.product,
          'quantity': 1,
          'totalPrice': item.product.price,
        };
      }
    }

    final groupedCartItems = groupedItems.values.toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.width * 0.057,
          ),
        ),
        leadingWidth: context.width * 0.15,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset(ImageConstants.backButton.getPng),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.12,
                ),
                Container(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // İçeriğe göre boyutlanma
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true, // Liste boyutu kadar alan kaplar
                        itemCount: groupedCartItems.length,
                        itemBuilder: (context, index) {
                          final item = groupedCartItems[index];
                          return ListTile(
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
                            subtitle: Text(
                                'Price: ${item['product'].price} x ${item['quantity']}'),
                            // trailing: Text('Total: ${item['totalPrice']}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove,
                                      color: Colors.red),
                                  onPressed: () {
                                      cartController.removeProductFromCart(
                                          item['product']);
                                    setState(() {
                                    });
                                  },
                                ),
                                Text(
                                  item['quantity'].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.width * 0.04,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add,
                                      color: Colors.green),
                                  onPressed: () {
                                    setState(() {
                                      cartController
                                          .addProductToCart(item['product']);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
