import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/components/navigation_bar.dart';
import 'package:playrr_app/screens/notifications/components/notifications_body.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Notificationes'),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/SecondaryBackButton.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const NotificationsBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex, context: context),
    );
  }
}
