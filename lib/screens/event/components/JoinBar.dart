import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';

class JoinBar extends StatefulWidget {
  final int price;
  const JoinBar({super.key, required this.price});

  @override
  State<JoinBar> createState() => _JoinBarState();
}

class _JoinBarState extends State<JoinBar> {
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
          child: Row(
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
        );
  }
}
