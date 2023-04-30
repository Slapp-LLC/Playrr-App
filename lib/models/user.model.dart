class UserModel {
  final int id;
  final String name;
  final String lastName;
  final String photoUrl;
  final String bio;

  UserModel(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.photoUrl,
      required this.bio});
}
