import 'package:flutter/material.dart';
import 'package:front/screens/menu_screen.dart';
import 'package:front/screens/customer_screen.dart';
import 'package:front/screens/supplier_screen.dart';
import 'package:front/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Establecer el límite máximo de anchura
        double maxWidthLimit = 600.0;

        // Obtener el ancho actual de la pantalla
        double currentWidth = constraints.maxWidth;

        // Aplicar límite máximo
        double maxWidth =
            currentWidth > maxWidthLimit ? maxWidthLimit : currentWidth;

        return MaterialApp(
          routes: {
            '/home': (context) => MenuScreen(),
            '/customer': (context) => CustomerScreen(),
            // '/products': (context) => ProductsScreen(),
            '/supplier': (context) => SupplierScreen(),
            // '/budget': (context) => BudgetrScreen(),
          },
          debugShowCheckedModeBanner: false,
          title: 'ProElectrics',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
