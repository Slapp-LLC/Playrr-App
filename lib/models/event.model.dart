import 'package:playrr_app/models/eventChat.model.dart';
import 'package:playrr_app/models/level.model.dart';
import 'package:playrr_app/models/sport.model.dart';
import 'package:playrr_app/models/user.model.dart';

class Event {
  final int id;
  final String title;
  final String? gender;
  final int price;
  final String location;
  final DateTime creationDate;
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final String? eventPhoto;
  final int spots;
  final String status;
  final User host;
  final Level level;
  final Sport sport;
  final List<Ticket> players;
  final EventChat eventChat;

  Event(
      {required this.id,
      required this.title,
      this.gender,
      required this.price,
      required this.location,
      required this.creationDate,
      required this.startDate,
      required this.endDate,
      required this.description,
      this.eventPhoto,
      required this.spots,
      required this.status,
      required this.host,
      required this.level,
      required this.sport,
      required this.players,
      required this.eventChat});
  Event.empty()
      : id = -1,
        title = '',
        gender = null,
        price = 0,
        location = '',
        creationDate = DateTime.now(),
        startDate = DateTime.now(),
        endDate = DateTime.now(),
        description = '',
        eventPhoto = '',
        spots = 0,
        status = '',
        host = User.empty(),
        level = Level.empty(),
        sport = Sport.empty(),
        players = ([]),
        eventChat = EventChat.empty();

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        title: json['title'],
        gender: json['gender'],
        price: json['price'],
        location: json['location'],
        creationDate: DateTime.parse(json['creationDate']),
        startDate: DateTime.parse(json['startDate']),
        endDate: DateTime.parse(json['endDate']),
        description: json['description'],
        eventPhoto: json['eventPhoto'],
        spots: json['spots'],
        status: json['status'],
        host: User.fromJson(json['host']),
        level: Level.fromJson(json['level']),
        sport: Sport.fromJson(json['sport']),
        players: (json['players'] as List)
            .map((player) => Ticket.fromJson(player))
            .toList(),
        eventChat:
            EventChat.fromJson(json['groupChat'] as Map<String, dynamic>));
  }
}

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
