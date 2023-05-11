class EventChat {
  final int id;

  EventChat({required this.id});

  factory EventChat.fromJson(Map<String, dynamic> json) {
    return EventChat(
      id: json['id'],
    );
  }

  EventChat.empty() : id = 0;
}
