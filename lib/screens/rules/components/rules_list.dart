import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';

class RulesList extends StatelessWidget {
  RulesList({super.key});
  final List<String> bulletPoints = [
    'Cada uno tiene que probar qué se siente ser el arquero. No te escapes de la rotación.',
    'Jugamos limpio, nada de faltas a propósito ni actitudes antideportivas.',
    'Nada de insultos ni burlas. Jugamos como amigos.',
    'Todos jugamos la misma cantidad de tiempo. No importa si eres Messi o si recién empiezas.',
    'Aquí no se le echa la culpa a nadie. Todos somos parte del equipo.',
    'No queremos peleas. Si no puedes manejarlo, este no es tu lugar.',
    'Nada de jugadas peligrosas. Queremos seguir jugando la próxima semana.',
    'Si hiciste falta o la pelota salió por ti, admítelo.',
    'Al final del día, estamos aquí para disfrutar. Más importa cómo jugamos que quién gana.'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: bulletPoints.map((point) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('- ',
                  style: TextStyle(fontSize: 20, color: greenPrimaryColor)),
              Expanded(
                child: Text(
                  point,
                  style: const TextStyle(fontSize: 16, color: bodyTextColor),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
