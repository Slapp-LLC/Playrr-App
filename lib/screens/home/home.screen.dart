import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/navigation_bar.dart';
import 'package:playrr_app/components/main_appbar.dart';
import 'package:playrr_app/components/main_drawer.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/home/components/body.dart';
import 'package:playrr_app/services/location.service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//? La navegacion con el menu inferior se tendra que hacer
//? en esta pagina, generar una lista con todas las rutas a utilizar en
// la barra de navegacion y
class _HomeState extends State<Home> {
  UserProvider userProvider = Get.find<UserProvider>();
  final eventsController = Get.find<EventsController>();
  final int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    eventsController.getRecomendedEvents();
    LocationService.instance.getCurrentCoordinate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: const MainAppBar(),
        body: const Body(),
        endDrawer: const MainDrawer(),
        bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: _selectedIndex, context: context));
  }
}
