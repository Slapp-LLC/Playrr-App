class Sport {
  final int id;
  final String name;
  final String photoUrl;
  final String iconUrl;

  @override
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
  Sport.empty()
      : id = -1,
        name = '',
        photoUrl = '',
        iconUrl = '';
}
