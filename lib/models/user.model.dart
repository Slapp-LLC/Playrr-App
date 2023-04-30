class UserModel {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final int age;
  final String photoUrl;
  final String? bio;
  final String? country;
  final List<dynamic> userSports;
  final List<dynamic> matches;
  final UserRole role;

  UserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.age,
    required this.photoUrl,
    this.bio,
    this.country,
    required this.userSports,
    required this.matches,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      age: json['age'],
      photoUrl: json['photoUrl'],
      bio: json['bio'],
      country: json['country'],
      userSports: json['userSports'],
      matches: json['matches'],
      role: UserRole.fromJson(json['role']),
    );
  }
}

class UserRole {
  final int id;
  final String name;

  UserRole({required this.id, required this.name});

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      id: json['id'],
      name: json['name'],
    );
  }
}
