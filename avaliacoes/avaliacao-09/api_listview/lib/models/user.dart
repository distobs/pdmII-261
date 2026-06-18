class User {
  final String name;
  final String login;

  User({
    required this.name,
    required this.login,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      login: json["login"],
    );
  }
}
