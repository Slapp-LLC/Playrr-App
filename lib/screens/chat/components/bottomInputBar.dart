import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _textEditingController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  fillColor: secondaryBackground,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.white60),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
    );
  }
}
