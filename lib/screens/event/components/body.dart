import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/models/event.model.dart';
import 'package:playrr_app/providers/events.provider.dart';
import 'package:playrr_app/screens/event/components/ChatSection.dart';
import 'package:playrr_app/screens/event/components/DateSection.dart';
import 'package:playrr_app/screens/event/components/JoinBar.dart';
import 'package:playrr_app/screens/event/components/LevelAndSportSection.dart';
import 'package:playrr_app/screens/event/components/LocationSection.dart';
import 'package:playrr_app/screens/event/components/ParticipantsSections.dart';

class EventBody extends StatefulWidget {
  final int eventId;
  const EventBody({super.key, required this.eventId});

  @override
  State<EventBody> createState() => _EventBodyState();
}

class _EventBodyState extends State<EventBody> {
  final EventsController _eventsController = Get.find<EventsController>();
  final EventsProvider _eventsProvider = Get.find<EventsProvider>();

  @override
  void initState() {
    super.initState();
    _eventsController.getAnEvent(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _eventsController.getAnEvent(widget.eventId),
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
            return Obx(() {
              Event currentEvent = _eventsProvider.currentEvent.value;
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the border radius if needed
                            child: currentEvent.eventPhoto != null
                                ? Image.network(
                                    currentEvent.eventPhoto!,
                                    height: 199,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/images/Splash.png',
                                    height: 199,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              currentEvent.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Bebas neue',
                                  fontSize: 25),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
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
                                      currentEvent.description,
                                      style: const TextStyle(
                                          color: bodyTextColor, fontSize: 16),
                                    ),
                                  ),
                                ]),
                          ),
                          LevelAndSport(
                              levelName: currentEvent.level.name,
                              sportName: currentEvent.sport.name),
                          LocationSection(location: currentEvent.location),
                          DateSection(date: currentEvent.startDate),
                          ParticipantsSection(
                            hostAvatar: currentEvent.host.photoUrl,
                            hostId: currentEvent.host.id,
                            spotsNumber: currentEvent.spots,
                            playersList: currentEvent.players,
                          ),
                          ChatSection(
                            id: currentEvent.eventChat.id,
                          )
                        ],
                      ),
                    )),
                    SafeArea(
                      child: JoinBar(
                        price: currentEvent.price,
                        eventId: currentEvent.id,
                      ),
                    )
                  ],
                ),
              );
            });
          }
        }));
  }
}
