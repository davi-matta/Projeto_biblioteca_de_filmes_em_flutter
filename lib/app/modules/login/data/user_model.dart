class User {
  String id;
  String email;
  String name;

  User({
    required this.id,
    required this.email,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> map, String id) {
    return User(
      id: id,
      email: map['email'],
      name: map['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
    };
  }
}