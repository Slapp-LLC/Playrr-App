import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/event/components/JoinBar.dart';

class EventBody extends StatefulWidget {
  final int eventId;
  const EventBody({super.key, required this.eventId});

  @override
  State<EventBody> createState() => _EventBodyState();
}

class _EventBodyState extends State<EventBody> {
  late Future<Map<String, dynamic>> _eventDataFuture;

  Future<Map<String, dynamic>> _getEventData() async {
    try {
      final response = await Dio()
          .get('${dotenv.env['API_ENDPOINT']}/event/${widget.eventId}');
      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    _getEventData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getEventData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: const Center(
                child: CircularProgressIndicator(
                  color: greenPrimaryColor,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: const Center(
                child: Text(
                  'Error loading event data',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          } else {
            final eventData = snapshot.data!;
            return Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 199,
                        decoration:
                            const BoxDecoration(color: secondaryBackground),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          eventData['title'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Bebas neue',
                              fontSize: 25),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          eventData['description'],
                          style: const TextStyle(
                              color: bodyTextColor, fontSize: 16),
                        ),
                      ),

                      // U
                      //se the eventData object to build the UI here
                    ],
                  ),
                )),
                JoinBar(price: eventData['price'])
              ],
            );
          }
        }));
  }
}
