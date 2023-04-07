import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final BuildContext context;

  const CustomBottomNavigationBar(
      {super.key, required this.selectedIndex, required this.context});
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/myEvents');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  activeIcon:
                      SvgPicture.asset('assets/icons/ActiveHomeIcon.svg'),
                  label: 'home'),
              BottomNavigationBarItem(
                  backgroundColor: secondaryBackground,
                  icon: SvgPicture.asset('assets/icons/TicketsIcon.svg'),
                  activeIcon:
                      SvgPicture.asset('assets/icons/ActiveEventsIcon.svg'),
                  label: 'Your events'),
              BottomNavigationBarItem(
                  backgroundColor: secondaryBackground,
                  icon: SvgPicture.asset('assets/icons/SearchIcon.svg'),
                  label: 'Search Page'),
              BottomNavigationBarItem(
                  backgroundColor: secondaryBackground,
                  icon: SvgPicture.asset('assets/icons/NotificationIcon.svg'),
                  label: 'Notifications'),
              BottomNavigationBarItem(
                  backgroundColor: secondaryBackground,
                  icon: SvgPicture.asset('assets/icons/MessageIcon.svg'),
                  label: 'Messages'),
            ],
            currentIndex: selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: secondaryBackground,
            onTap: _onItemTapped,
          ),
        ));
  }
}
