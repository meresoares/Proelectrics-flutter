class Person {
  final int personID;
  final String firstName;
  final String lastName;
  final String address;
  final String phone;
  final String email;

  Person({
    required this.personID,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phone,
    required this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      personID: json['personID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
