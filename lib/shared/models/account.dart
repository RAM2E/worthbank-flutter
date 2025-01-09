class Account {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final double balance;

  Account({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.balance,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      balance: json['balance'].toDouble(),
    );
  }
}
