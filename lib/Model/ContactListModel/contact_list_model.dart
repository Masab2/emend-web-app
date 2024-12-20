class Contact {
  String firstName;
  String lastName;
  String mobileNo;
  String email;

  Contact({
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.email,
  });
}

class ContactListModel {
  String name;
  String description;
  List<Contact> contacts;

  ContactListModel({
    required this.name,
    required this.description,
    required this.contacts,
  });
}
