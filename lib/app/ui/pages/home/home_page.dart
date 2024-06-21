import 'package:dyshez_test/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/colors_theme.dart';
import '../detail_order/detail_order_page.dart';
import '../login/login_page.dart';
import 'controller/home_controller.dart';

class HomePage extends StatelessWidget {
  static const String route = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Scaffold(
      backgroundColor: primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
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
                  InkWell(
                    onTap: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: const Text('¿Quieres cerrar sesión?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                    child: const Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        controller.logout();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false,
                        );
                      }
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pedidos anteriores',
                      style: TextStyle(
                        color: Color(0xFF797979),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: FutureBuilder(
                        future: controller.getOrders(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text('No hay órdenes disponibles.'));
                          } else {
                            final orders = snapshot.data!;
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: orders.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 16),
                              itemBuilder: (context, itmsIndex) {
                                final item = orders[itmsIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/seed/407/600',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.nameBusiness,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            item.products != null
                                                ? Text(
                                                    "${item.products?.length ?? ""} artículos · \$${calculateTotal(item.products!)}",
                                                    style: const TextStyle(color: neutral),
                                                  )
                                                : const Text(
                                                    "\$0.00",
                                                    style: TextStyle(color: neutral),
                                                  ),
                                            Text(
                                              item.type,
                                              style: const TextStyle(color: neutral),
                                            ),
                                            RichText(
                                              textScaler: MediaQuery.of(context).textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: parseDate(item.dateOrder),
                                                    style: const TextStyle(color: neutral),
                                                  ),
                                                  const TextSpan(
                                                    text: " · ",
                                                    style: TextStyle(color: neutral),
                                                  ),
                                                  TextSpan(
                                                    text: generateText(item.status),
                                                    style: TextStyle(
                                                      color: generateColorText(item.status),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: generateImage(item.type),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context, DetailOrderPage.route, arguments: item);
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: defaultSecondaryColor,
                                        size: 24,
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 8)),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
