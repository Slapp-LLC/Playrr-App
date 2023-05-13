import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.Rules);
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: secondaryBackground,
              width: 1.5,
            ),
          ),
        ),
        margin: const EdgeInsets.only(top: 0),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Row(
          children: [
            Container(
                width: 52,
                height: 52,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: greenPrimaryColor.withOpacity(0.33), width: 1)),
                child: Transform.scale(
                  scale: 0.75,
                  child: SvgPicture.asset(
                    'assets/icons/Question.svg',
                  ),
                )),
            Flexible(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Reglas de juego',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ),
                        Text(
                          'Reglas de la comunidad',
                          style: TextStyle(color: bodyTextColor),
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
                ])),
          ],
        ),
      ),
    );
  }
}
