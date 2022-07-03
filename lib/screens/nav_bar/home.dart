import 'package:flutter/material.dart';
import 'package:real_cafe/screens/nav_bar/order_details.dart';
import 'package:real_cafe/utilities/constants.dart';
import 'package:real_cafe/widgets/search_bar_home.dart';

import '../../widgets/coffee_grid_item.dart';
import '../../widgets/logo_shopping_cart_row.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentSelected = 3;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Column(
                children: [
                  logoShoppingCartRow(cartPressed: () {}),
                  const SizedBox(height: 13),
                  searchBarHome(
                      screenWidth: screenWidth,
                      onChanged: (value) {},
                      onSubmitted: (value) {}),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(
                width: screenWidth,
                height: screenHeight * 0.59,
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: double.infinity,
                      padding: const EdgeInsets.only(top: 35),
                      decoration: const BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: drinkCategories.length,
                        itemBuilder: (context, index) {
                          return TextButton(
                              onPressed: () {
                                currentSelected = index;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 40.0),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    drinkCategories[index].name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: kPrimary.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(width: 25),
                    SizedBox(
                      height: screenHeight * 0.59,
                      width: screenWidth * 0.77,
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 17,
                        crossAxisSpacing: 17,
                        childAspectRatio: (135 / 235),
                        children:
                            drinkCategories[currentSelected].items.map((item) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetails(coffeeOrder: item),
                                ),
                              );
                            },
                            child: coffeeGridItem(
                              rating: item.rating,
                              imgUrl: item.imgUrl,
                              name: item.name,
                              price: item.price,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
