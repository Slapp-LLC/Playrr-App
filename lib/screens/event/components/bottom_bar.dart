import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          child: const NoSpotsBar(),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/CheckMark.svg'),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            'TU ASISTES A ESTE PARTIDO!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
