import 'dart:developer';

import 'package:snap_cart/core/models/order/cart_item_model.dart';

class OrderRepository {
  final List<CartItemModel> _cartItems = [];

// Sepete ürün ekleme
  void addCartItem(CartItemModel cartItem) {
    _cartItems.add(cartItem);
  }

// Sepetten ürün çıkarma
  void removeCartItem(CartItemModel cartItem) {
    _cartItems.remove(cartItem);
  }

// Sepetin içeriğini getirme
  List<CartItemModel> getCartItems() {
    if (_cartItems.isEmpty) {
      log('Cart is empty');
    } else {
      log('Cart items: $_cartItems');
    }
    return _cartItems;
  }

// Sepet toplamını hesaplama
  double getTotalPrice() {
    return _cartItems.fold(
        0, (total, item) => total + (item.product.price * item.quantity));
  }
}
