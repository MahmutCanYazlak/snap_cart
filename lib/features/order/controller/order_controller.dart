import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/core/models/order/cart_item_model.dart';

import '../repository/order_repository.dart';

final orderControllerProvider = Provider((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);
  return OrderController(orderRepository);
});

final orderRepositoryProvider = Provider((ref) {
  return OrderRepository();
});

class OrderController {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository);

  void addProductToCart(CartItemModel cartItem) {
    _orderRepository.addCartItem(cartItem);
  }

  void removeProductFromCart(CartItemModel cartItem) {
    _orderRepository.removeCartItem(cartItem);
  }

  List<CartItemModel> getCartItems() {
    return _orderRepository.getCartItems();
  }

  double getTotalPrice() {
    return _orderRepository.getTotalPrice();
  }
}
