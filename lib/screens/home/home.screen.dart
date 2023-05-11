import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/CustomBottomNavigationBar.dart';
import 'package:playrr_app/components/MainAppBar.dart';
import 'package:playrr_app/components/MainDrawer.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/models/myUser.model.dart';
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
    // TODO: implement initState
    super.initState();
    eventsController.getRecomendedEvents();
    LocationService.instance.getCurrentLocation();
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
