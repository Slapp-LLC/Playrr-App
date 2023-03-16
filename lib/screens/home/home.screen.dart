import 'package:flutter/material.dart';
import 'package:playrr_app/components/MainAppBar.dart';
import 'package:playrr_app/components/MainDrawer.dart';
import 'package:playrr_app/screens/home/components/body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: Body(),
      endDrawer: MainDrawer(),
    );
  }
}
