import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/sport_picking/components/ResultList.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<dynamic> _sportsList = [];

  @override
  void initState() {
    super.initState();
    _getSportsList();
  }

  Future _getSportsList() async {
    try {
      final response = await Dio().get('${dotenv.env['API_ENDPOINT']}/sport');
      setState(() {
        _sportsList = response.data;
      });
      return _sportsList;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_sportsList.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(
            color: greenPrimaryColor,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'Escoge los deportes que te interesen',
              style: TextStyle(
                  color: titleTextColor,
                  fontFamily: 'Bebas neue',
                  fontSize: 25),
            ),
          ),
          Expanded(child: SportList(sportData: _sportsList)),
        ]),
      );
    }
  }
}
