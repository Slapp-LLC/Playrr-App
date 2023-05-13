import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';

class NoResults extends StatelessWidget {
  const NoResults({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/no-results.png'),
              const Text(
                'No encontramos partidos cerca de ti',
                style: TextStyle(color: bodyTextColor),
              )
            ],
          ),
        ));
  }
}
