import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/signup.controller.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  String _value = '';

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_value != widget.value) {
            setState(() {
              _value = widget.value;
            });
            widget.onChanged(_value);
          }
        });

        widget.onChanged(widget.value);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            color: secondaryBackground,
            borderRadius: BorderRadius.circular(50.0)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: bodyTextColor,
              fontSize: 17,
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: widget.groupValue == _value
                    ? greenPrimaryColor
                    : Colors.black,
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: greenPrimaryColor, width: 3)),
          )
        ]),
      ),
    );
  }
}
