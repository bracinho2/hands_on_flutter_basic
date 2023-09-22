class BeerEntity {
  final String uid;
  final String brand;
  final String city;

  BeerEntity({
    required this.uid,
    required this.brand,
    required this.city,
  });

  @override
  String toString() {
    return 'Brand: $brand - City: $city';
  }
}
