class UserModel {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final int age;
  final String? photoUrl;
  final String? bio;
  final String? country;
  final List<UserSport> userSports;
  final List<dynamic> matches;
  final UserRole role;

  UserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.age,
    this.photoUrl,
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
      userSports: (json['userSports'] as List<dynamic>)
          .map((e) => UserSport.fromJson(e as Map<String, dynamic>))
          .toList(),
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

class Sport {
  final int id;
  final String name;
  final String photoUrl;
  final String iconUrl;

  Sport(
      {required this.id,
      required this.name,
      required this.photoUrl,
      required this.iconUrl});

  factory Sport.fromJson(Map<String, dynamic> json) {
    return Sport(
      id: json['id'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      iconUrl: json['iconUrl'],
    );
  }
}

class Level {
  final int id;
  final String name;

  Level({required this.id, required this.name});

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'],
      name: json['name'],
    );
  }
}
