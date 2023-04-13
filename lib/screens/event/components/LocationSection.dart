import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';

class LocationSection extends StatefulWidget {
  final String location;
  const LocationSection({super.key, required this.location});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 52,
                height: 52,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: greenPrimaryColor, width: 1)),
                child: SvgPicture.asset('assets/icons/LocationGreenIcon.svg')),
            Expanded(
                child: GestureDetector(
              onTap: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ubicacion',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          Text(
                            widget.location,
                            style: const TextStyle(color: bodyTextColor),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Transform.rotate(
                        angle: 180 * 3.14 / 180,
                        child: SvgPicture.asset(
                            'assets/icons/SecondaryBackButton.svg'),
                      ),
                    )
                  ]),
            ))
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 165,
          decoration: const BoxDecoration(color: secondaryBackground),
        )
      ]),
    );
  }
}
