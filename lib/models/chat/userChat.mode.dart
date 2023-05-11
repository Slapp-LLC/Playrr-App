class UserChatModel {
  final int id;
  UserChatModel({required this.id});
  factory UserChatModel.fromJson(Map<String, dynamic> json) {
    return UserChatModel(
      id: json['id'],
    );
  }
}
