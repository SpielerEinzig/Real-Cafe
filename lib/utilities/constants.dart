import 'package:flutter/material.dart';
import 'package:real_cafe/models/drink_category.dart';

import '../models/coffee_order.dart';

const kBackgroundColor = Color(0xff201520);
const kPrimary = Color(0xffEFE3C8);
const kUnselectedColor = Color(0xff746763);
const kCardColor = Color(0xff362C36);
const kHintTextColor = Color(0xff92877F);
const kCoffeeGrid = Color(0xff463D46);
const kCoffeeOrderRating = Color(0xff414141);
const kCoffeeRatingStarOrder = Color(0xffD3A601);

List<DrinkCategory> drinkCategories = [
  DrinkCategory(name: "Hot Coffee", items: coffeeOrderItems),
  DrinkCategory(name: "Chocolate", items: chocolateOrders),
  DrinkCategory(name: "Iced Coffee", items: icedCoffeeOrders),
  DrinkCategory(name: "Coffee Shake", items: coffeeShakeOrders),
];

List<CoffeeOrder> icedCoffeeOrders = [
  CoffeeOrder(
      name: "Heavy Cream Iced Coffee",
      addition: "Drizzled with Heavy Cream",
      imgUrl: "assets/images/coffeeShake/coffee-shake1.jpeg",
      price: 99,
      rating: 4.5,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
  CoffeeOrder(
      name: "Creamed Iced Coffee",
      addition: "Drizzled with Cream",
      imgUrl: "assets/images/coffeeShake/coffee-shake2.jpeg",
      price: 99,
      rating: 4.5,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
];

List<CoffeeOrder> coffeeShakeOrders = [
  CoffeeOrder(
      name: "Parfait",
      addition: "Drizzled with Whipped Chocolate",
      imgUrl: "assets/images/coffeeShake/coffee-shake1.jpeg",
      price: 99,
      rating: 4.5,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
  CoffeeOrder(
      name: "Whipped cream coffee shake",
      addition: "Topped with whipped cream",
      imgUrl: "assets/images/coffeeShake/coffee-shake2.jpeg",
      price: 99,
      rating: 4.5,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
  CoffeeOrder(
      name: "Frosted Coffee Shake",
      addition: "Topped with frosting",
      imgUrl: "assets/images/coffeeShake/coffee-shake3.jpeg",
      price: 99,
      rating: 4.5,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
];

List<CoffeeOrder> chocolateOrders = [
  CoffeeOrder(
      name: "Whipped Cream Chocolate",
      addition: "Drizzled with Whipped Cream",
      imgUrl: "assets/images/chocolate/chocolate1.jpeg",
      price: 99,
      rating: 4.5,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
  CoffeeOrder(
      name: "Marshmallow Chocolate Drink",
      addition: "Drizzled with Chocolate",
      imgUrl: "assets/images/chocolate/chocolate2.jpeg",
      price: 99,
      rating: 4.5,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
];

List<CoffeeOrder> coffeeOrderItems = [
  CoffeeOrder(
      name: "Cinnamon & Cocoa",
      addition: "Drizzled with Caramel",
      imgUrl: "assets/images/coffee/coffee1.png",
      price: 99,
      rating: 4.5,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
  CoffeeOrder(
      name: "Espresso",
      addition: "Drizzled with Caramel",
      imgUrl: "assets/images/coffee/coffee2.png",
      price: 199,
      rating: 4.0,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
  CoffeeOrder(
      name: "Bursting Blueberry",
      addition: "Drizzled with Caramel",
      imgUrl: "assets/images/coffee/coffee3.png",
      price: 249,
      rating: 4.8,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
  CoffeeOrder(
      name: "Cappuccino",
      addition: "Drizzled with Caramel",
      imgUrl: "assets/images/coffee/coffee4.png",
      price: 24,
      rating: 4.0,
      description: "A single espresso shot poured into hot foamy milk, \n"
          "with the surface topped with mildly sweetened \n"
          "cocoa powder and drizzled with scrumptious \n"
          "caramel syrup."),
];