import 'package:playrr_app/models/level.model.dart';
import 'package:playrr_app/models/sport.model.dart';

class MyUserModel {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final int? age;
  final String? photoUrl;
  final String? bio;
  final String? country;
  final List<UserSport>? userSports;
  final List<dynamic>? matches;
  final UserRole role;

  MyUserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    this.age,
    this.photoUrl,
    this.bio,
    this.country,
    this.userSports,
    this.matches,
    required this.role,
  });

  factory MyUserModel.fromJson(Map<String, dynamic> json) {
    return MyUserModel(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      age: json['age'],
      photoUrl: json['photoUrl'],
      bio: json['bio'],
      country: json['country'],
      userSports: json['userSports'] != null
          ? (json['userSports'] as List<dynamic>)
              .map((e) => UserSport.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
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

class UserSport {
  final Sport sport;
  final Level level;

  UserSport({required this.sport, required this.level});

  factory UserSport.fromJson(Map<String, dynamic> json) {
    return UserSport(
      sport: Sport.fromJson(json['sport']),
      level: Level.fromJson(json['level']),
    );
  }
}
