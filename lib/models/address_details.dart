class AddressModel {
  String name;
  int phoneNumber;
  String state;
  int zipCode;
  String houseNumber;
  bool isHome;

  AddressModel({
    required this.name,
    required this.houseNumber,
    required this.isHome,
    required this.phoneNumber,
    required this.state,
    required this.zipCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          phoneNumber == other.phoneNumber &&
          houseNumber == other.houseNumber;

  @override
  int get hashCode => houseNumber.hashCode;
}
