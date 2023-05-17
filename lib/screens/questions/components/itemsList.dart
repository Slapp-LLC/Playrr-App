import 'package:playrr_app/screens/questions/components/item.dart';

List<Item> generateItems() {
  return <Item>[
    Item(
      expandedValue:
          'Playrr es una plataforma que te permite encontrar partidos de deportes y jugadores en tu área, de acuerdo a tu disponibilidad y nivel de habilidad. Solo tienes que descargar la app, registrarte, seleccionar tu deporte preferido y estarás listo para jugar.',
      headerValue: '¿Qué es Playrr y cómo funciona?',
    ),
    Item(
      expandedValue:
          'Una vez que estés en la app, puedes buscar partidos disponibles o crear uno nuevo. También puedes filtrar los partidos por deporte, ubicación, fecha y nivel de habilidad.',
      headerValue: '¿Cómo encuentro un partido en Playrr?',
    ),
    Item(
      expandedValue:
          'Una vez que hayas encontrado un partido que te interese, solo tienes que hacer clic en "Unirse" y seguir los pasos para confirmar tu participación.',
      headerValue: '¿Cómo me uno a un partido en Playrr?',
    ),
    Item(
      expandedValue:
          'El uso de la aplicación es gratuito. Sin embargo, cada jugador paga una pequeña tarifa por partido al que se une, que se cobra automáticamente a través de la aplicación.',
      headerValue: '¿Cuánto cuesta usar Playrr?',
    ),
    Item(
      expandedValue:
          'Por cada partido al que te unes, ganas puntos que puedes canjear por recompensas en la aplicación, como descuentos en futuros partidos, equipo deportivo y más.',
      headerValue: '¿Cómo funciona el sistema de recompensas de Playrr?',
    ),
    Item(
      expandedValue:
          'Sí, puedes crear tu propio partido e invitar a otros usuarios de la aplicación a unirse.',
      headerValue: '¿Puedo crear mi propio partido en Playrr?',
    ),
    Item(
      expandedValue:
          'En Playrr, nos tomamos muy en serio la seguridad de nuestros usuarios. Verificamos la identidad de todos los usuarios y proporcionamos un sistema de calificaciones y revisiones para ayudar a mantener un ambiente seguro y respetuoso.',
      headerValue: '¿Cómo se garantiza la seguridad en Playrr?',
    ),
    Item(
      expandedValue:
          'Playrr ofrece una amplia gama de deportes, incluyendo fútbol, baloncesto, voleibol, y más.',
      headerValue: '¿Qué deportes puedo jugar en Playrr?',
    ),
  ];
}
