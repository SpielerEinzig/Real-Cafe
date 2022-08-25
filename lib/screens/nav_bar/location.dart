import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_cafe/models/address_details.dart';
import 'package:real_cafe/provider/address_provider.dart';
import 'package:real_cafe/widgets/add_address_text_field.dart';
import 'package:real_cafe/widgets/address_type_widget.dart';
import 'package:real_cafe/widgets/minor_button.dart';
import 'package:real_cafe/widgets/saved_address_card.dart';

import '../../utilities/constants.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  int selectedAddress = 0;
  bool addressTypeHome = true;

  @override
  Widget build(BuildContext context) {
    List<AddressModel> savedAddresses =
        context.read<AddressProvider>().savedAddresses;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "My Addresses",
          style: TextStyle(
            color: kPrimary,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 17,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 25,
                  right: 25,
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add delivery address",
                        style: TextStyle(
                          fontSize: 16,
                          color: kPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      AddAddressTextField(
                        controller: _nameController,
                        hintText: "Name",
                        numberOnly: false,
                      ),
                      AddAddressTextField(
                        controller: _phoneNumberController,
                        hintText: "Phone Number",
                        numberOnly: true,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AddAddressTextField(
                              controller: _stateController,
                              hintText: "State",
                              numberOnly: false,
                            ),
                          ),
                          const SizedBox(width: 11),
                          Expanded(
                            child: AddAddressTextField(
                              controller: _pinCodeController,
                              hintText: "Pin Code",
                              numberOnly: false,
                            ),
                          ),
                        ],
                      ),
                      AddAddressTextField(
                        controller: _houseNumberController,
                        hintText: "House Number",
                        numberOnly: false,
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        "Type of address",
                        style: TextStyle(
                          fontSize: 16,
                          color: kPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          AddressTypeWidget(
                            isSelected: addressTypeHome == true,
                            onTap: () {
                              setState(() {
                                addressTypeHome = true;
                              });
                            },
                            label: "Home",
                            iconData: Icons.home,
                          ),
                          AddressTypeWidget(
                            isSelected: addressTypeHome == false,
                            onTap: () {
                              setState(() {
                                addressTypeHome = false;
                              });
                            },
                            label: "Work",
                            iconData: Icons.apartment,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MinorButton(
                            onTap: () {},
                            text: "Save",
                            color: kPrimary,
                            textColor: kBackgroundColor,
                            borderColor: kPrimary,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
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
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Saved Addresses",
                      style: TextStyle(
                        fontSize: 18,
                        color: kPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      child: Column(
                        children: savedAddresses.map((address) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAddress =
                                    savedAddresses.indexOf(address);
                              });
                            },
                            child: SavedAddressCard(
                              addressModel: address,
                              isSelected: savedAddresses.indexOf(address) ==
                                  selectedAddress,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
