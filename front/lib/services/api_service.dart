import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://localhost:3001';

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    print(
        'Realizando solicitud a: $baseUrl/$endpoint'); // Utiliza baseUrl directamente

    if (response.statusCode == 200) {
      // La solicitud fue exitosa, analiza el cuerpo de la respuesta
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      // Si la solicitud no fue exitosa, lanza una excepción
      throw Exception('Error al cargar datos desde la API');
    }
  }

  // Puedes agregar más funciones para manejar diferentes tipos de solicitudes (POST, PUT, etc.)
}
