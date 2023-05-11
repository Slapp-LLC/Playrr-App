class Sender {
  final int id;
  final String name;
  final String lastName;
  final String? photoUrl;

  Sender(
      {required this.id,
      required this.name,
      required this.lastName,
      this.photoUrl});

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      photoUrl: json['photoUrl'] as String?,
    );
  }
}
