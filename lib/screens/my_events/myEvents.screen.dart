import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/CustomBottomNavigationBar.dart';
import 'package:playrr_app/components/SecondaryAppBar.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/my_events/components/myEvents_body.dart';
import 'package:playrr_app/screens/my_events/components/passedEvents.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, '/myEvents');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text('Mis partidos'),
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
