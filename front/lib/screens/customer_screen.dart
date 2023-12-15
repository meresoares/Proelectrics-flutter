import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/proelectris_widget.dart';
import '../widgets/search_widget.dart';
import '../model/customer_model.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  late TextEditingController searchController;
  late List<Customer> customers;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    customers = [];
    fetchCustomers();
  }

  Future<void> fetchCustomers() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3001/customers/getAll'));
      if (response.statusCode == 200) {
        setState(() {
          customers = (json.decode(response.body) as List)
              .map((data) => Customer.fromJson(data))
              .toList();
        });
      } else {
        print(
            'Error al obtener clientes. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      // Manejo de errores de red u otros
      print('Error de red: $e');
      // Mostrar un mensaje de error al usuario o realizar acciones de manejo de errores
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProWidget(
      title: 'Sistema xxxx',
      body: Column(
        children: [
          // Nuevo widget de búsqueda
          SearchWidget(
            title: 'Pantalla de clientes',
            subtitle: 'Buscar clientes',
            searchController: searchController,
            onSearch: (String searchText) {
              // Lógica de búsqueda para clientes
              // Realiza la búsqueda con el texto ingresado
              print('Buscando clientes con el texto: $searchText');
            },
            onAdd: () {
              // Lógica para agregar cliente
              print('Agregando nuevo cliente');
            },
            proWidget: ProWidget(
              title: '',
              body: Container(),
              icons: [],
              pageTitles: [],
            ), // Puedes cambiar estos valores según tu necesidad
          ),
          // Lista de clientes
          Expanded(
            child: ListView.separated(
              itemCount: customers.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (context, index) {
                final customer = customers[index];
                final person = customer.person;

                return ListTile(
                  title: Text('${person.firstName} ${person.lastName}'),
                  // Mostrar nombre completo
                  // Otros campos según tu modelo
                );
              },
            ),
          ),
        ],
      ),
      iconColor: Colors.amber,
      iconSize: 30.0,
      menuColor: Colors.white,
      // Utiliza las propiedades de la instancia de ProWidget
      icons: [
        Icons.home,
        Icons.person,
        Icons.shopping_basket,
        Icons.local_shipping,
        Icons.attach_money,
      ],
      // Utiliza las propiedades de la instancia de ProWidget
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
