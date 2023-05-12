import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: ListTile.divideTiles(
          color: bodyTextColor,
          context: context,
          tiles: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Specify your radius here
              ),
              child: ListTile(
                title: const Text(
                  'Cuenta',
                  style: TextStyle(color: bodyTextColor),
                ),
                onTap: () {
                  // Navigate to 'Cuenta' settings screen
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Specify your radius here
              ),
              child: ListTile(
                title: const Text(
                  'Términos y condiciones',
                  style: TextStyle(color: bodyTextColor),
                ),
                onTap: () {
                  // Navigate to 'Términos y condiciones' screen
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Specify your radius here
              ),
              child: ListTile(
                title: const Text(
                  'Políticas de privacidad',
                  style: TextStyle(color: bodyTextColor),
                ),
                onTap: () {
                  // Navigate to 'Políticas de privacidad' screen
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Specify your radius here
              ),
              child: ListTile(
                title: const Text(
                  'Envío de sugerencias',
                  style: TextStyle(color: bodyTextColor),
                ),
                onTap: () {
                  // Navigate to 'Envío de sugerencias' screen
                },
              ),
            ),
          ],
        ).toList());
  }
}
