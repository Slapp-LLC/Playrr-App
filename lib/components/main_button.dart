import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final bool isLoading;

  const MainButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.isPrimary,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isPrimary ? greenPrimaryColor : Colors.black;
    final textColor = isPrimary ? Colors.black : Colors.white;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
      ),
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                  value: null, // set to null to use the default size
                  strokeWidth: 2.0,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                    color: textColor, fontFamily: 'Bebas Neue', fontSize: 23),
              ),
      ),
    );
  }
}
