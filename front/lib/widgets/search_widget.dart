import 'package:flutter/material.dart';
import '../widgets/proelectris_widget.dart';

class SearchWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController searchController;
  final ValueChanged<String> onSearch;
  final VoidCallback onAdd;
  final ProWidget proWidget;

  const SearchWidget({
    required this.title,
    required this.subtitle,
    required this.searchController,
    required this.onSearch,
    required this.onAdd,
    required this.proWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: proWidget.icons.length * 23.0, // Ancho del menú lateral
        right: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kToolbarHeight, // Altura del AppBar de ProWidget
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: title.split(" ")[0],
                        style: const TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: title.split(" ")[1],
                        style: const TextStyle(color: Colors.amber),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: onAdd,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Agregar cliente',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            //Ocupa la mitad de la pantalla
            width: MediaQuery.of(context).size.width * 0.5,
            height: 35,
            // Establece un límite máximo de 400.0
            constraints: const BoxConstraints(maxWidth: 400.0),
            decoration: BoxDecoration(
              //Color del fondo del buscador - gris claro
              color: Colors.grey.withOpacity(0.2),
              //Bordes redondeado
              borderRadius: BorderRadius.circular(30.0),
              //Color del borde
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => onSearch(searchController.text),
                    alignment: Alignment.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: onSearch,
                      decoration: const InputDecoration(
                        hintText: 'Buscar...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
