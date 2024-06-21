import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/models/order_mdl.dart';

class HomeController extends ChangeNotifier {
  final supabase = Supabase.instance.client;
  Future<List<Order>> getOrders() async {
    final response = await supabase.from('orders').select('*, order_details(cantidad, precio, products(*))').eq('usuario_id', supabase.auth.currentUser!.id);
    return response.map((order) => Order.fromJson(order)).toList();
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
