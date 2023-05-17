import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:playrr_app/constants.dart';

class BottomBar extends StatefulWidget {
  final int price;
  final int eventId;
  const BottomBar({super.key, required this.price, required this.eventId});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: secondaryBackground,
              borderRadius: BorderRadius.circular(50)),
          //Todo make this conditional
          child: YouAreComing(),
        ));
  }
}

class NoSpotsBar extends StatelessWidget {
  const NoSpotsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/SadFace.svg'),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            'NO HAY MAS LUGARES DISPONIBLES',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

class YouAreComing extends StatelessWidget {
  const YouAreComing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/CheckMark.svg'),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'TU ASISTES A ESTE PARTIDO!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      padding: const EdgeInsets.all(30),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: bodyTextColor),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(
                                        color: secondaryBackground,
                                        width: 2.0), // Add this line
                                  ),
                                  minimumSize: const Size.fromHeight(50),
                                  backgroundColor: Colors.black),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Invitar a jugar',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    minimumSize: const Size.fromHeight(50),
                                    backgroundColor: errorColor),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .exit_to_app, // Icon to signify 'exit' or 'leave'
                                      color: Colors
                                          .white, // Change this color as per your design
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        'Abandonar el juego',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ));
                });
          },
          icon: const Icon(
            Icons.more_horiz,
            size: 30,
            color: bodyTextColor,
          ),
        ),
      ],
    );
  }
}
