import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/main_button.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/providers/events.provider.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final EventsProvider _eventsProvider = Get.find<EventsProvider>();
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: secondaryBackground,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _eventsProvider.currentEvent.value.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Bebas neue',
                              fontSize: 20),
                        ),
                        Text(
                          _eventsProvider.currentEvent.value.startDate
                              .toString(),
                          style: const TextStyle(
                              color: bodyTextColor, fontSize: 14),
                        ),
                        Text(
                          _eventsProvider.currentEvent.value.location,
                          style: const TextStyle(
                              color: bodyTextColor, fontSize: 14),
                        )
                      ],
                    ),
                    ClipRRect(
                      // Adjust the border radius if needed
                      child: _eventsProvider.currentEvent.value.eventPhoto !=
                              null
                          ? Image.network(
                              _eventsProvider.currentEvent.value.eventPhoto!,
                              height: 90,
                              width: 104,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/Splash.png',
                              fit: BoxFit.cover,
                              width: 90,
                              height: 104,
                            ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Precio',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '\$${_eventsProvider.currentEvent.value.price.toString()}',
                            style: const TextStyle(color: bodyTextColor),
                          )
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Metodo de pago',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Efectivo, en el lugar',
                            style: TextStyle(color: bodyTextColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Uniendote al partido aceptas los terminos y condiciones',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: bodyTextColor),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MainButton(
                      text: 'Unirse', onPressed: () {}, isPrimary: true),
                )
              ],
            )));
  }
}
