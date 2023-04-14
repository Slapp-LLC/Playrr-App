import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class ParticipantsSection extends StatefulWidget {
  final String hostAvatar;
  final int hostId;
  final spotsNumber;
  const ParticipantsSection(
      {super.key,
      required this.hostAvatar,
      required this.hostId,
      required this.spotsNumber});

  @override
  State<ParticipantsSection> createState() => _ParticipantsSectionState();
}

class _ParticipantsSectionState extends State<ParticipantsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: secondaryBackground,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Host',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                  onTap: () {},
                  child: const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: CircleAvatar(
                        backgroundColor: secondaryBackground,
                        radius: 25,
                      ))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Players 0/${widget.spotsNumber}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.EventParticipants,
                      arguments: '');
                },
                child: SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Stack(
                        children: [
                          const Positioned(
                            child: CircleAvatar(
                              backgroundColor: secondaryBackground,
                              backgroundImage: NetworkImage(
                                  'https://images.pagina12.com.ar/styles/focal_3_2_360x240/public/2023-04/715923-lionel-20messi.jpg?h=c6980913&itok=dOYCJttG'),
                              radius: 25,
                            ),
                          ),
                          const Positioned(
                            left: 25,
                            child: CircleAvatar(
                              backgroundColor: secondaryBackground,
                              backgroundImage: NetworkImage(
                                  'https://images.pagina12.com.ar/styles/focal_3_2_360x240/public/2023-04/715923-lionel-20messi.jpg?h=c6980913&itok=dOYCJttG'),
                              radius: 25,
                            ),
                          ),
                          const Positioned(
                            left: 50,
                            child: CircleAvatar(
                              backgroundColor: secondaryBackground,
                              backgroundImage: NetworkImage(
                                  'https://images.pagina12.com.ar/styles/focal_3_2_360x240/public/2023-04/715923-lionel-20messi.jpg?h=c6980913&itok=dOYCJttG'),
                              radius: 25,
                            ),
                          ),
                          Positioned(
                            left: 75,
                            child: Container(
                              width: 50.5,
                              height: 50.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color:
                                          greenPrimaryColor.withOpacity(0.50))),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0x001e2021)
                                            .withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '+3',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: greenPrimaryColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
