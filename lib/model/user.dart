class User {
  User({
    required this.name,
    required this.avatar,
  });

  String name;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'avatar': avatar,
      };
}
