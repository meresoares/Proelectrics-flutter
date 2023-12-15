import 'package:flutter/material.dart';
import '../widgets/proelectris_widget.dart';
import '../services/api_service.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return ProWidget(
      title: 'Sistema xxxx',
      body: const Center(
        child: Text(
          'Pantalla Proveedores',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 40),
        ),
      ), // Contenido específico de la pantalla Person aquí,
      iconColor: Colors.amber,
      iconSize: 30.0,
      menuColor: Colors.white,
      icons: [
        Icons.home,
        Icons.person,
        Icons.shopping_basket,
        Icons.local_shipping,
        Icons.attach_money,
      ],
      pageTitles: [
        'Inicio',
        'Clientes',
        'Productos',
        'Proveedor',
        'Presupuesto'
      ],
    );
  }
}
