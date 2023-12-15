import 'package:front/model/person_model.dart';

class Customer {
  final int customerID;
  final int personID;
  final String purchaseHistory;
  final String preferences;
  final Person person;

  Customer({
    required this.customerID,
    required this.personID,
    required this.purchaseHistory,
    required this.preferences,
    required this.person,
    // Para inicializar person
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerID: json['customerID'],
      personID: json['personID'],
      purchaseHistory: json['purchaseHistory'],
      preferences: json['preferences'],
      person: Person.fromJson(json['person']),
      // Asumiendo que 'person' está presente en el JSON
    );
  }
}
