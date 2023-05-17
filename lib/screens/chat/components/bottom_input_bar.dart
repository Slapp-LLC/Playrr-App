import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playrr_app/constants.dart';

class BottomInputBar extends StatefulWidget {
  const BottomInputBar({Key? key}) : super(key: key);

  @override
  _BottomInputBarState createState() => _BottomInputBarState();
}

class _BottomInputBarState extends State<BottomInputBar> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.black,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: _textEditingController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    fillColor: secondaryBackground,
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.white60),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/SendMessageIcon.svg'),
              color: Colors.white,
            ),
          ],
        ),
      ),
    ));
  }
}
