import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';

// Lista de títulos correspondientes a cada ícono en el menú
const List<String> pageTitles = [
  'Inicio',
  'Clientes',
  'Productos',
  'Proveedor',
  'Presupuesto',
];

class ProWidget extends StatefulWidget {
  final String title;
  final Widget body;
  final List<IconData> icons;
  final List<String> pageTitles;
  final Color? menuColor;
  final Color? iconColor;
  final double? iconSize;

  // Constantes y valores predeterminados
  static const Color defaultMenuColor = Colors.grey;
  static const Color defaultIconColor = Colors.amber;
  static const double defaultIconSize = 24.0;

  const ProWidget({
    Key? key,
    required this.title,
    required this.body,
    required this.icons,
    required this.pageTitles,
    this.menuColor,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  @override
  _ProWidgetState createState() => _ProWidgetState();

  // Nuevas propiedades y estado
  static int currentPageIndex = 0;
}

class _ProWidgetState extends State<ProWidget> {
  static const double minScreenWidthForTitles = 900.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              widget.body,
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: buildMenu(screenWidth),
              )
            ],
          )),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    double drawerWidth =
        MediaQuery.of(context).size.width * 0.06; // Ancho del Drawer
    return AppBar(
      title: Text(widget.title),
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: ProWidget.defaultIconColor),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: ProWidget.defaultIconColor, width: 0.5)),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 50, // Utilizar el ancho del Drawer
          child: Image.asset(
            'assets/images/logo-proelectrics.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(
              Icons.logout,
              color: ProWidget.defaultIconColor,
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ),
      ],
    );
  }

  Widget buildMenu(double screenWidth) {
    bool showTitles = screenWidth > minScreenWidthForTitles;
    return Container(
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey, width: 0.5))),
      child: Drawer(
        width: showTitles ? screenWidth * 0.06 : 56.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final showTitles = screenWidth > minScreenWidthForTitles;
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: InkWell(
                onTap: () {
                  setState(() {
                    ProWidget.currentPageIndex = index;
                  });
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, '/home');
                      break;
                    case 1:
                      Navigator.pushNamed(context, '/customer');
                      break;
                    case 2:
                      Navigator.pushNamed(context, '/products');
                      break;
                    case 3:
                      Navigator.pushNamed(context, '/supplier');
                      break;
                    case 4:
                      Navigator.pushNamed(context, '/budget');
                      break;
                    default:
                      break;
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icons[index],
                      color: ProWidget.currentPageIndex == index
                          ? Colors
                              .grey //Cambia el color cuando la pagina esta seleccionada
                          : widget.iconColor ?? ProWidget.defaultIconColor,
                      size: widget.iconSize ?? ProWidget.defaultIconSize,
                    ),
                    if (showTitles && screenWidth > minScreenWidthForTitles)
                      const SizedBox(height: 4.0),
                    if (showTitles &&
                        screenWidth > minScreenWidthForTitles &&
                        screenWidth > 600.0)
                      ClipRect(
                        child: Align(
                          alignment: Alignment.center,
                          heightFactor: 1.0,
                          child: Text(
                            pageTitles[index],
                            style: const TextStyle(fontSize: 12.0),
                            overflow: TextOverflow
                                .ellipsis, // Esto añade puntos suspensivos (...) al final si el texto es muy largo
                            maxLines:
                                1, // Establece el número máximo de líneas a mostrar
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              // Espacio que separa un icono del otro
              height: 25.0,
              // Color de las lineas que separan los iconos
              color: Colors.transparent,
            );
          },
          itemCount: widget.icons.length,
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 40,
        color: Colors.amber,
        child: const Center(
          child: Text(
            'Nombre del Sistema',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
