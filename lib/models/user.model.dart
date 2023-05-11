class User {
  final int id;
  final String name;
  final String lastName;
  final String? photoUrl;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      photoUrl: json['photoUrl'],
    );
  }

  User.empty()
      : id = -1,
        name = '',
        lastName = '',
        photoUrl = '';
}
