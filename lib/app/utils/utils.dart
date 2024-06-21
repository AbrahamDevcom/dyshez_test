import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/models/order_product_mdl.dart';
import '../ui/theme/colors_theme.dart';

extension ListDivideExt<T extends Widget> on Iterable<T> {
  Iterable<MapEntry<int, Widget>> get enumerate => toList().asMap().entries;

  List<Widget> divide(Widget t) => isEmpty ? [] : (enumerate.map((e) => [e.value, t]).expand((i) => i).toList()..removeLast());

  List<Widget> around(Widget t) => addToStart(t).addToEnd(t);

  List<Widget> addToStart(Widget t) => enumerate.map((e) => e.value).toList()..insert(0, t);

  List<Widget> addToEnd(Widget t) => enumerate.map((e) => e.value).toList()..add(t);

  List<Padding> paddingTopEach(double val) => map((w) => Padding(padding: EdgeInsets.only(top: val), child: w)).toList();
}

double calculateTotal(List<OrderProduct> lst) {
  double value = 0.00;
  for (var i = 0; i < lst.length; i++) {
    value += (lst[i].quantity * lst[i].product.price);
  }
  return value;
}

parseDate(DateTime dateOrder) {
  final formatter = DateFormat.MMMd();
  return formatter.format(dateOrder);
}

generateText(String status) {
  return status == "complete" ? "Completado" : "No presentado";
}

generateColorText(String status) {
  return status == "complete" ? neutral : errorColor;
}

generateImage(String type) {
  return type == "Dyshez Direct"
      ? Image.asset(
          'assets/icons/dyrect.png',
          width: 20,
          height: 20,
          fit: BoxFit.cover,
        )
      : Image.asset(
          'assets/icons/promo.png',
          width: 20,
          height: 20,
          fit: BoxFit.cover,
        );
}

generateTextDyshez(String status) {
  return status == "complete"
      ? const Text(
          "Completado",
          style: TextStyle(
            color: successColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        )
      : const Text("Cancelado",
          style: TextStyle(
            color: errorColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ));
}

generateTextPromo(String status) {
  return status == "complete"
      ? const Text(
          "Presentado",
          style: TextStyle(
            color: successColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        )
      : const Text("No show",
          style: TextStyle(
            color: errorColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ));
}

formatTime(DateTime time) {
  final formatter = DateFormat.jm();
  return formatter.format(time);
}

double calculateDiscount(List<OrderProduct> items) {
  double value = 0.00;
  for (var i = 0; i < items.length; i++) {
    value += ((items[i].quantity * items[i].product.price) - items[i].price);
  }
  return value;
}
