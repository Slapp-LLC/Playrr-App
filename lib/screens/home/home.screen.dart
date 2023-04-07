import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/components/CustomBottomNavigationBar.dart';
import 'package:playrr_app/components/MainAppBar.dart';
import 'package:playrr_app/components/MainDrawer.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/home/components/body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//? La navegacion con el menu inferior se tendra que hacer
//? en esta pagina, generar una lista con todas las rutas a utilizar en
// la barra de navegacion y
class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: const Body(),
        endDrawer: const MainDrawer(),
        bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: _selectedIndex, context: context));
  }
}
