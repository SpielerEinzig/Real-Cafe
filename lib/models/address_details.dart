class AddressModel {
  String name;
  String userId;
  int phoneNumber;
  String state;
  int zipCode;
  String houseNumber;
  bool isHome;
  String id;

  AddressModel({
    required this.name,
    required this.userId,
    required this.houseNumber,
    required this.isHome,
    required this.phoneNumber,
    required this.state,
    required this.zipCode,
    required this.id,
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
