import 'package:flutter/material.dart';
import 'package:playrr_app/screens/rules/components/rules_list.dart';

class RulesBody extends StatelessWidget {
  const RulesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Reglas de juego',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Bebas neue', fontSize: 25),
            ),
          ),
          RulesList()
        ],
      ),
    );
  }
}
