import 'package:flutter/material.dart';
import 'package:real_cafe/utilities/dummy_coupons.dart';
import 'package:real_cafe/widgets/coupon_ticket_widget.dart';
import 'package:real_cafe/widgets/minor_button.dart';

import '../../utilities/constants.dart';
import '../../widgets/add_address_text_field.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  final TextEditingController _couponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Redeem Coupon",
          style: TextStyle(fontSize: 25, color: kPrimary),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Icon(
              Icons.arrow_back,
              size: 25,
              color: kPrimary,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 25,
                color: kPrimary,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 22),
        child: Column(
          children: [
            Container(
              height: size.height * 0.23,
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 19, left: 16, bottom: 13, right: 19),
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.airplane_ticket_sharp,
                        color: kUnselectedColor,
                        size: 30,
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Redeem Coupon",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: kPrimary,
                        ),
                      ),
                    ],
                  ),
                  AddAddressTextField(
                    numberOnly: true,
                    controller: _couponController,
                    hintText: "Enter your 10 0r 12 digit coupon code",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MinorButton(
                        text: "Clear",
                        color: kBackgroundColor,
                        borderColor: kPrimary,
                        textColor: kPrimary,
                        onTap: () {},
                      ),
                      MinorButton(
                        text: "Add",
                        color: kPrimary,
                        textColor: kBackgroundColor,
                        borderColor: kPrimary,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/dashes.png"),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: dummyCouponList.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: CouponTicketWidget(
                          name: item["name"], expiryDate: item["expiry"]),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 58.0),
              child: Text(
                "We Value Your Savings As Much As You Do. Order now And Keep "
                "Saving On Everything With The Latest Coupons and Offers!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: kPrimary.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
