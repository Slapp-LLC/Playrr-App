import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';

class OutlineIconButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  const OutlineIconButton({
    Key? key,
    required this.iconPath,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: bodyTextColor, width: 1)),
      width: double.infinity,
      child: ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: onPressed,
          icon: SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
          ),
          label: Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          )),
    );
  }
}
