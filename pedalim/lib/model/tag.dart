class Tag{
  final int id;
  final String brand;
  final int price;

  Tag({required this.id,required this.brand,required this.price});

  factory Tag.fromJson(Map<String, dynamic> data) => Tag(
      id: data['id'],
      brand: data['attributes']['brand'],
      price: data['attributes']['price']
  );
}