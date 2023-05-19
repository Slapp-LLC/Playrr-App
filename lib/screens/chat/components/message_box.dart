import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';

class MessageBox extends StatefulWidget {
  final String message;
  final int messageId;
  final String date;
  final int index;
  const MessageBox(
      {super.key,
      required this.date,
      required this.message,
      required this.messageId,
      required this.index});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(),
        child: widget.index % 2 == 0 ? const UserMessage() : const MyMessage());
  }
}

class UserMessage extends StatelessWidget {
  const UserMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pedrido Jamon',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        IntrinsicWidth(
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 260),
          child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: secondaryBackground,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Message',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '12:52',
                      style: TextStyle(fontSize: 13, color: bodyTextColor),
                    ),
                  )
                ],
              )),
        ))
      ],
    );
  }
}

class MyMessage extends StatelessWidget {
  const MyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IntrinsicWidth(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 260),
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NO se que es lo que',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '12:52',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
