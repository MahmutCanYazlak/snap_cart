import '../getMethods/products/get_alll_products.dart';

class CartItemModel {
  final Product product;
  int quantity;

  CartItemModel({required this.product, required this.quantity});

  // Eşitlik kontrolü ekleniyor
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItemModel && other.product.id == product.id;
  }

  @override
  int get hashCode => product.id.hashCode;

  // Sepetteki ürünün fiyatını hesaplamak için ek fonksiyon
  double get totalPrice => product.price * quantity;
}
