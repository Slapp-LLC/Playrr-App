import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';

class ComingBar extends StatefulWidget {
  const ComingBar({super.key});

  @override
  State<ComingBar> createState() => _ComingBarState();
}

class _ComingBarState extends State<ComingBar> {
  @override
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
                          border: Border.all(color: secondaryBackground),
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
                                    side: BorderSide(
                                        color:
                                            greenPrimaryColor.withOpacity(0.50),
                                        width: 2.0), // Add this line
                                  ),
                                  minimumSize: const Size.fromHeight(50),
                                  backgroundColor: Colors.black),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: greenPrimaryColor,
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
