import 'product_mdl.dart';

class OrderProduct {
  final Product product;
  final int price;
  final int quantity;

  OrderProduct({
    required this.product,
    required this.price,
    required this.quantity,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      product: Product.fromJson(json['products']),
      price: json['precio'],
      quantity: json['cantidad'],
    );
  }
}
