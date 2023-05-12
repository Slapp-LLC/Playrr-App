import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/services/events.service.dart';

class JoinBar extends StatefulWidget {
  final int price;
  final int eventId;
  const JoinBar({super.key, required this.price, required this.eventId});

  @override
  State<JoinBar> createState() => _JoinBarState();
}

class _JoinBarState extends State<JoinBar> {
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
          decoration: BoxDecoration(
              color: greenPrimaryColor,
              borderRadius: BorderRadius.circular(50)),
          child: TextButton(
            onPressed: () {
              EventService.instance.joinEvent(widget.eventId);
            },
            child: const Text(
              'Lets play',
              style: TextStyle(
                  fontFamily: 'Bebas neue', color: Colors.black, fontSize: 25),
            ),
          ),
        )
      ],
    );
  }
}
