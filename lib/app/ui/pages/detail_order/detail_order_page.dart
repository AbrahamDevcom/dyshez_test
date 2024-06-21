import 'package:dyshez_test/app/domain/models/order_mdl.dart';
import 'package:dyshez_test/app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../theme/colors_theme.dart';

class DetailOrderPage extends StatefulWidget {
  const DetailOrderPage({super.key});

  static const String route = "/detail_order";
  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  @override
  Widget build(BuildContext context) {
    Order order = ModalRoute.of(context)!.settings.arguments as Order;
    return Scaffold(
      backgroundColor: primaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Historial',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/food.png',
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x0F000000),
                              offset: Offset(
                                0,
                                2,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.nameBusiness,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (order.type == "Dyshez Direct") generateTextDyshez(order.status),
                                  if (order.type == "Promo Live") generateTextPromo(order.status),
                                  const Text(
                                    ' · ',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: neutral,
                                    ),
                                  ),
                                  Text(
                                    "${parseDate(order.dateOrder)} a las ${formatTime(order.dateOrder)}",
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: neutral,
                                    ),
                                  ),
                                ],
                              ),
                              if (order.products != null)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      color: neutral,
                                      size: 18,
                                    ),
                                    Text(
                                      order.address,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: neutral,
                                      ),
                                    ),
                                  ],
                                ),
                              if (order.products != null)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Tu pedido',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          return ListView.separated(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              16,
                                              0,
                                              16,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: order.products!.length,
                                            separatorBuilder: (_, __) => const SizedBox(height: 8),
                                            itemBuilder: (context, itmsIndex) {
                                              final item = order.products![itmsIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFFFFF0F9),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Align(
                                                      alignment: const AlignmentDirectional(0, 0),
                                                      child: Text(
                                                        'x${item.quantity}',
                                                        style: const TextStyle(
                                                          color: primary,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      item.product.name,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  if (item.price != item.quantity * item.product.price)
                                                    Text(
                                                      "\$${(item.quantity * item.product.price).toStringAsFixed(2)}",
                                                      style: const TextStyle(
                                                        color: Color(0xFFA6A6A6),
                                                        fontWeight: FontWeight.w500,
                                                        decoration: TextDecoration.lineThrough,
                                                      ),
                                                    ),
                                                  Text(
                                                    "\$${(item.quantity * item.product.price).toStringAsFixed(2)}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 8)),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (order.products != null)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Total de los artículos',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "\$${calculateTotal(order.products!).toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Descuentos',
                                          style: TextStyle(fontSize: 15, color: successColor),
                                        ),
                                        Text(
                                          "-\$${calculateDiscount(order.products!).toStringAsFixed(2)}",
                                          style: const TextStyle(fontSize: 15, color: successColor),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Envío',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "\$0.00",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Propina',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "\$0.00",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (order.products == null)
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 32.0),
                                  child: Text(
                                    'Tu pedido',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (order.products == null)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      order.status == "complete" ? "Reserva de Promo Live" : "Penalización por No-Show",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      order.status == "complete" ? "\$0.00" : "\$500.00",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total pagado',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                  if (order.products != null)
                                    Text(
                                      "\$${(calculateTotal(order.products!) - calculateDiscount(order.products!)).toStringAsFixed(2)}",
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  if (order.products == null)
                                    Text(
                                      order.status == "complete" ? "\$0.00" : "\$500.00",
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: Color(0xFFE7E7E7),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Método de pago',
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/bank.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (order.type == "Dyshez Direct")
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE3026F),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        'Reordenar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              const CustomBtn(
                                label: 'Ver factura',
                              ),
                              if (order.type == "Promo Live")
                                const CustomBtn(
                                  label: '¿Necesitas ayuda?',
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 16)).addToEnd(const SizedBox(height: 16)),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 16)),
        ),
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xFFE7E7E7),
            width: 2,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
