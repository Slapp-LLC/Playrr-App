import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/home/components/MySportsSlider.dart';
import 'package:playrr_app/screens/home/components/resultList.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<dynamic> _eventResult = [];
  int _selectedSportId = 1;
  Future _getEventSports() async {
    final response = await Dio().get('${dotenv.env['API_ENDPOINT']}/event');
    setState(() {
      _eventResult = response.data;
    });
  }

  void _setSportSelection(int sportId) {
    setState(() {
      _selectedSportId = sportId;
    });
  }

  @override
  void initState() {
    super.initState();
    _getEventSports();
  }

  @override
  Widget build(BuildContext context) {
    if (_eventResult.isEmpty) {
      return Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: const Center(
            child: CircularProgressIndicator(
          color: greenPrimaryColor,
        )),
      );
    } else {
      return SingleChildScrollView(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text('Tus deportes',
                  style: TextStyle(
                    fontFamily: 'Bebas neue',
                    color: Colors.white,
                    fontSize: 25,
                  )),
            ),
            const MySportsSlider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text('Recomendados',
                  style: TextStyle(
                    fontFamily: 'Bebas neue',
                    color: Colors.white,
                    fontSize: 25,
                  )),
            ),
            EventResultList(
              resultsData: _eventResult,
            )
          ],
        ),
      ));
    }
  }
}
