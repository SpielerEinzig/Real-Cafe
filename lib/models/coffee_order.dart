class CoffeeOrder {
  String imgUrl;
  String name;
  double rating;
  String addition;
  String description;
  int price;

  CoffeeOrder(
      {required this.description,
      required this.name,
      required this.addition,
      required this.imgUrl,
      required this.price,
      required this.rating});
}
