class User {
  final String name;
  final String email;
  final String userName;
  final String? fatherName;

  User({
    required this.name,
    required this.email,
    required this.userName,
    this.fatherName,
  });
}
