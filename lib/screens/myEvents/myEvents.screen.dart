import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/CustomBottomNavigationBar.dart';
import 'package:playrr_app/components/SecondaryAppBar.dart';

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
    return Scaffold(
        appBar: const SecondaryAppBar(),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
            child: const Text(
              'My Events',
              style: TextStyle(color: Colors.white),
            )),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          context: context,
        ));
  }
}
