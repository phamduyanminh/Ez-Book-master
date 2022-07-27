class User {
  String? username;
  String? name;
  String? password;
  String? phone;

  User({
    this.username,
    this.name,
    this.password,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
    );
  }
}
