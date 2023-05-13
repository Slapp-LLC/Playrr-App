import 'package:flutter/material.dart';
import 'package:playrr_app/screens/sport_picking/components/SportCard.dart';

class SportList extends StatefulWidget {
  final List sportData;

  const SportList({super.key, required this.sportData});
  @override
  State<SportList> createState() => _SportListState();
}

class _SportListState extends State<SportList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.sportData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: Colors.black,
            child: SportCard(
              id: widget.sportData[index]['id'],
              photoUrl: widget.sportData[index]['photoUrl'],
              sportName: widget.sportData[index]['name'],
            ));
      },
    );
  }
}
