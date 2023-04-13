import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/constants.dart';

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
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: secondaryBackground,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$${eventData['price']}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  'A traves de Playrr',
                                  style: TextStyle(
                                      color: bodyTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: greenPrimaryColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Lets play',
                                style: TextStyle(
                                    fontFamily: 'Bebas neue',
                                    color: Colors.black,
                                    fontSize: 25),
                              ),
                            ),
                          )
                        ],
                      ),
                    ) //Your sticky widget here
                    )
              ],
            );
          }
        }));
  }
}
