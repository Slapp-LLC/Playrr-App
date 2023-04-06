import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/home/components/resultList.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<dynamic> _eventResult = [];

  Future _getEventSports() async {
    final response = await Dio().get('${dotenv.env['API_ENDPOINT']}/event');
    setState(() {
      _eventResult = response.data;
    });
    print(_eventResult);
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
      return Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Expanded(
                child: EventResultList(
              resultsData: _eventResult,
            ))
          ],
        ),
      );
    }
  }
}
