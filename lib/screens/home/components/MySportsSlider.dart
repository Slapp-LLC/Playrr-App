import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/screens/home/components/MySportCard.dart';

class MySportsSlider extends StatefulWidget {
  const MySportsSlider({super.key});

  @override
  State<MySportsSlider> createState() => _MySportsSliderState();
}

class _MySportsSliderState extends State<MySportsSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 155,
      margin: const EdgeInsets.only(bottom: 25, top: 10),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Change this to the number of items you want to display
        itemBuilder: (BuildContext context, int index) {
          // Replace the container with the widget you want to display for each item
          return MySportCard(index: index);
        },
      ),
    );
  }
}
