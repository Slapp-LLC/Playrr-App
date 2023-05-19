import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/screens/event/components/payment_card.dart';
import 'package:playrr_app/services/events.service.dart';

class JoinBar extends StatefulWidget {
  final int price;
  final int eventId;
  final VoidCallback onJoinEvent;

  const JoinBar(
      {super.key,
      required this.price,
      required this.eventId,
      required this.onJoinEvent});

  @override
  State<JoinBar> createState() => _JoinBarState();
}

class _JoinBarState extends State<JoinBar> {
  final EventsController _eventsController = Get.find<EventsController>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${widget.price}',
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
          width: 120,
          decoration: BoxDecoration(
              color: greenPrimaryColor,
              borderRadius: BorderRadius.circular(50)),
          child: TextButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Dialog(
                      backgroundColor: Colors.transparent,
                      child: PaymentCard(),
                    );
                  });
            },
            child: _isLoading
                ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      value: null, // set to null to use the default size
                      strokeWidth: 2.0,
                    ),
                  )
                : const Text(
                    'Lets play',
                    style: TextStyle(
                        fontFamily: 'Bebas neue',
                        color: Colors.black,
                        fontSize: 25),
                  ),
          ),
        )
      ],
    );
  }
}
