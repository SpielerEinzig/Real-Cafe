import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class AddressTypeWidget extends StatelessWidget {
  final bool isSelected;
  final IconData iconData;
  final String label;
  final VoidCallback onTap;
  const AddressTypeWidget({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.iconData,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? kPrimary : kHintTextColor,
            ),
            color: kTextFieldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                color: isSelected ? kPrimary : kHintTextColor,
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? kPrimary : kHintTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
