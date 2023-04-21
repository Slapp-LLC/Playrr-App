import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/screens/notifications/components/notification.dart';

class NotificationsBody extends StatefulWidget {
  const NotificationsBody({super.key});

  @override
  State<NotificationsBody> createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<NotificationsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: ListView.builder(
          itemCount: 40,
          itemBuilder: (context, index) {
            return const CustomNotification(
                title: 'Recordatorio',
                id: 2,
                message: "Tu partido esta por comenzar",
                notificationType: '');
          }),
    );
  }
}
