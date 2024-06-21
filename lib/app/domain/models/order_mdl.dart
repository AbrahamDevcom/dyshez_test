import 'order_product_mdl.dart';
import 'product_mdl.dart';

class Order {
  final String id;
  final String userId;
  final String type;
  final String status;
  final String nameBusiness;
  final String address;
  final DateTime dateOrder;
  final List<OrderProduct>? products;

  Order({
    required this.id,
    required this.userId,
    required this.type,
    required this.status,
    required this.nameBusiness,
    required this.address,
    required this.dateOrder,
    this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['usuario_id'],
      type: json['tipo'],
      status: json['estado'],
      nameBusiness: json['nombre_comercion'],
      address: json['direccion'],
      dateOrder: DateTime.parse(json['fecha_creacion']),
      products: json['tipo'] == 'Dyshez Direct' ? (json['order_details'] as List<dynamic>?)?.map((product) => OrderProduct.fromJson(product)).toList() : null,
    );
  }
}
