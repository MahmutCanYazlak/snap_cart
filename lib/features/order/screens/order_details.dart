import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/features/order/controller/order_controller.dart';
import '../../../config/routes/app_route_name.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../widgets/cart_item_list.dart';
import '../widgets/payment_information_cart.dart';
import '../widgets/payment_summary.dart';

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
    final Map<String, dynamic> groupedItems = {};

    // Ürünleri gruplama işlemi
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

    var taxesCharges =
        (cartController.getTotalPrice() * 0.20).toStringAsFixed(2);
    var discount = (cartController.getTotalPrice() * 0.09).toStringAsFixed(2);
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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Image.asset(ImageConstants.backButton.getPng),
          ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.12,
              ),
              CartItemList(
                groupedCartItems: groupedCartItems,
                onIncrease: (cartItem) {
                  setState(() {
                    cartController.addProductToCart(cartItem);
                  });
                },
                onDecrease: (cartItem) {
                  setState(() {
                    cartController.removeProductFromCart(cartItem);
                  });
                },
                onProductTap: (product) {
                  Navigator.pushNamed(
                    context,
                    RouteNames.productDetail,
                    arguments: product,
                  );
                },
              ),
              PaymentInformationCart(
                  cartController: cartController,
                  taxesCharges: taxesCharges,
                  discount: discount),
              PaymentSummary(
                  cartController: cartController,
                  taxesCharges: taxesCharges,
                  discount: discount)
            ],
          ),
        ),
      ),
    );
  }
}
