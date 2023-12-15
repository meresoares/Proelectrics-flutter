import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Establecer un factor de escala personalizado
    double customScaleFactor = 0.5;

    // Crear un MediaQueryData personalizado con el factor de escala ajustado
    MediaQueryData customMediaQuery = MediaQuery.of(context).copyWith(
      textScaleFactor: customScaleFactor,
    );

    return MediaQuery(
      data: customMediaQuery,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          // Barra superior
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.amber),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.amber, width: 0.5))),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logo-proelectrics.jpg',
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ), // Logo en la esquina superior izquierda
            ),
            title: const Text(
              'Nombre del Sistema',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.amber, // Icono de logout en amarillo
                  ),
                  onPressed: () {
                    SystemNavigator.pop(); // Cierra la aplicación
                  },
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Column(
                children: [
                  Text(
                    '¡Bienvenido!',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                      // Tamaño del texto ajustado
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Fila de iconos del menu
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSquareMenuItem(
                      context,
                      Icons.person,
                      'Cliente',
                      '/customer',
                    ),
                    _buildSquareMenuItem(
                      context,
                      Icons.shopping_basket,
                      'Productos',
                      '/products',
                    ),
                    _buildSquareMenuItem(
                      context,
                      Icons.local_shipping,
                      'Proveedor',
                      '/supplier',
                    ),
                    _buildSquareMenuItem(
                      context,
                      Icons.attach_money,
                      'Presupuesto',
                      '/budget',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 40,
            color: Colors.amber, // Fondo amarillo para la franja inferior
            child: const Center(
              child: Text(
                'Nombre del Sistema',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSquareMenuItem(
      BuildContext context, IconData icon, String label, String routeName) {
    return InkWell(
      onTap: (() {
        Navigator.pushNamed(context, routeName);
      }),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        // Ajusta el porcentaje según sea necesario
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono del ítem del menú
                Flexible(
                  child: Icon(icon,
                      size: MediaQuery.of(context).size.width * 0.06,
                      // Tamaño inicial de los iconos del menu
                      color: Colors.amber),
                ),
                const SizedBox(height: 5),
                // Texto del ítem del menú
                Flexible(
                    child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
