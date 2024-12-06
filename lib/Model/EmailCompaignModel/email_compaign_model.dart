class AccountManager {
  final String name;
  final String contact;

  AccountManager({required this.name, required this.contact});
}

List<AccountManager> generateRandomAccountManagers(int count) {
  final names = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Davis',
    'Diana Clarke',
    'Evan Miller',
    'Fiona Green',
    'George White',
    'Hannah Brown',
    'Ian Black',
    'Julia Adams'
  ];
  final contacts = List.generate(count,
      (index) => '+1-800-${(1000 + index * 123).toString().padLeft(4, '0')}');

  return List.generate(
    count,
    (index) => AccountManager(
        name: names[index % names.length], contact: contacts[index]),
  );
}
