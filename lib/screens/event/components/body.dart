import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/event/components/ChatSection.dart';
import 'package:playrr_app/screens/event/components/DateSection.dart';
import 'package:playrr_app/screens/event/components/JoinBar.dart';
import 'package:playrr_app/screens/event/components/LocationSection.dart';
import 'package:playrr_app/screens/event/components/ParticipantsSections.dart';

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
      print(response.data);
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
            return Container(
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   height: 199,
                        //   decoration:
                        //       const BoxDecoration(color: secondaryBackground),
                        // ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the border radius if needed
                          child: Image.network(
                            eventData['eventPhoto'],
                            height: 199,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: secondaryBackground,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Descripcion',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    eventData['description'],
                                    style: const TextStyle(
                                        color: bodyTextColor, fontSize: 16),
                                  ),
                                ),
                              ]),
                        ),
                        LocationSection(location: eventData['location']),
                        DateSection(date: eventData['startDate']),
                        ParticipantsSection(
                          hostAvatar: eventData['host']['photoUrl'],
                          hostId: 2,
                          spotsNumber: eventData['spots'],
                        ),
                        const ChatSection()
                      ],
                    ),
                  )),
                  JoinBar(price: eventData['price']),
                ],
              ),
            );
          }
        }));
  }
}
