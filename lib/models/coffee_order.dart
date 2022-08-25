class CoffeeOrder {
  String imgUrl;
  String id;
  String name;
  double rating;
  String addition;
  String description;
  int price;

  CoffeeOrder(
      {required this.description,
      required this.name,
      required this.id,
      required this.addition,
      required this.imgUrl,
      required this.price,
      required this.rating});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoffeeOrder &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
