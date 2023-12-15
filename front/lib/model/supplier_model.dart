class Supplier {
  final int supplierID;
  final int personID;
  final String company;
  final String productType;
  final int rating;

  Supplier({
    required this.supplierID,
    required this.personID,
    required this.company,
    required this.productType,
    required this.rating,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      supplierID: json['supplierID'],
      personID: json['personID'],
      company: json['company'],
      productType: json['productType'],
      rating: json['rating'],
    );
  }
}
