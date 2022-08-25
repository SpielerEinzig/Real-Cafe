import 'package:real_cafe/models/coffee_order.dart';

class CartItems {
  int amount;
  String id;
  CoffeeOrder order;

  CartItems({required this.amount, required this.order, required this.id});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItems &&
          runtimeType == other.runtimeType &&
          order == other.order &&
          amount == other.amount;

  @override
  int get hashCode => order.hashCode;
}
