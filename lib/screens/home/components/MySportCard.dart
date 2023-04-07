import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';

class MySportCard extends StatefulWidget {
  final int index;
  const MySportCard({super.key, required this.index});

  @override
  State<MySportCard> createState() => _MySportCardState();
}

class _MySportCardState extends State<MySportCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127,
      height: 155,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
          color: secondaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Center(child: Text('Item')),
    );
  }
}
