import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Center(
        child: Column(
          children: const [
            Text(
              'Playrr',
              style: TextStyle(fontSize: 100, color: Colors.black),
            ),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
