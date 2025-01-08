class DummyContactModel {
  String firstName;
  String lastName;
  String email;
  String phone;

  DummyContactModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });
}

// Dummy Static List
List<DummyContactModel> dummyContacts = [
  DummyContactModel(
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phone: '123-456-7890',
  ),
  DummyContactModel(
    firstName: 'Jane',
    lastName: 'Doe',
    email: 'jane.doe@example.com',
    phone: '987-654-3210',
  ),
  DummyContactModel(
    firstName: 'Jane',
    lastName: 'Doe',
    email: 'masabhaider4@gmail.com',
    phone: '987-654-3210',
  ),
];
