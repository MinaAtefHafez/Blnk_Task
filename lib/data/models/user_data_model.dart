class UserModel {
   String firstName;
   String lastName;
   String address;
   String landline;
   String phoneNumber;
   String area;
   String cardID;

  UserModel(
      {this.firstName = '',
      this.lastName = '',
      this.address = '',
      this.landline = '',
      this.phoneNumber = '',
      this.area = 'Cairo',
      this.cardID = ''});

  static const firstRow = [
    'First Name',
    'Last Name',
    'Address',
    'Landline',
    'Phone Number',
    'Area',
    'Card ID',
  ];

  Map<String, dynamic> toMap() {
    return {
      'First Name': firstName,
      'Last Name': lastName,
      'Address': address,
      'Landline': landline,
      'Phone Number': phoneNumber,
      'Area': area,
      'Card ID': cardID,
    };
  }
}
