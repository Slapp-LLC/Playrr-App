import 'package:flutter/material.dart';
import 'package:playrr_app/components/CustomBottomNavigationBar.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/my_events/components/myevents.body.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  final _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                'Mis partidos',
                style: TextStyle(fontSize: 16),
              ),
              bottom: const TabBar(
                unselectedLabelColor: bodyTextColor,
                unselectedLabelStyle: TextStyle(fontSize: 17),
                labelStyle: TextStyle(fontSize: 17),
                indicatorColor: greenPrimaryColor,
                tabs: [
                  Tab(text: 'Proximos'),
                  Tab(text: 'Concluidos'),
                ],
              ),
              centerTitle: true,
            ),
            body: const MyEventsBody(),
            bottomNavigationBar: CustomBottomNavigationBar(
              selectedIndex: _selectedIndex,
              context: context,
            )));
  }
}
