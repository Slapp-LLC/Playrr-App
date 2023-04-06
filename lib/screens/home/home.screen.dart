import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/components/MainAppBar.dart';
import 'package:playrr_app/components/MainDrawer.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/home/components/body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: const Body(),
        endDrawer: const MainDrawer(),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      backgroundColor: secondaryBackground,
                      icon: SvgPicture.asset('assets/icons/HomeIcon.svg'),
                      label: 'home'),
                  BottomNavigationBarItem(
                      backgroundColor: secondaryBackground,
                      icon: SvgPicture.asset('assets/icons/TicketsIcon.svg'),
                      label: 'Your events'),
                  BottomNavigationBarItem(
                      backgroundColor: secondaryBackground,
                      icon: SvgPicture.asset('assets/icons/SearchIcon.svg'),
                      label: 'Search Page'),
                  BottomNavigationBarItem(
                      backgroundColor: secondaryBackground,
                      icon:
                          SvgPicture.asset('assets/icons/NotificationIcon.svg'),
                      label: 'Notifications'),
                  BottomNavigationBarItem(
                      backgroundColor: secondaryBackground,
                      icon: SvgPicture.asset('assets/icons/MessageIcon.svg'),
                      label: 'Messages'),
                ],
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: secondaryBackground,
              ),
            )));
  }
}
