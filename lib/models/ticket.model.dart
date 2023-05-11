import 'package:playrr_app/models/user.model.dart';

class Ticket {
  final int id;
  final DateTime createdAt;
  final String status;
  final User user;

  Ticket({
    required this.id,
    required this.createdAt,
    required this.status,
    required this.user,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      status: json['status'],
      user: User.fromJson(json['user']),
    );
  }
}
