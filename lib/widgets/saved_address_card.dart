import 'package:flutter/material.dart';
import 'package:real_cafe/models/address_details.dart';

import '../utilities/constants.dart';

class SavedAddressCard extends StatelessWidget {
  final AddressModel addressModel;
  final bool isSelected;
  const SavedAddressCard({
    Key? key,
    required this.addressModel,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        //height: size.height * 0.11,
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? kPrimary : Colors.transparent),
          color: kCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: size.width * 0.11,
              // height: size.height * 0.05,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kCoffeeGrid,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                addressModel.isHome ? Icons.home : Icons.apartment,
                size: 28,
                color: kAddressIconColor,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addressModel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  width: size.width * 0.65,
                  height: size.height * 0.04,
                  child: Text(
                    addressModel.houseNumber,
                    //overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                      color: kAddressSubText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
