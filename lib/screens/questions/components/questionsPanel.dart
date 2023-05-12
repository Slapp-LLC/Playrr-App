import 'package:flutter/material.dart';

class QuestionsPanel extends StatefulWidget {
  const QuestionsPanel({Key? key}) : super(key: key);

  @override
  _QuestionsPanelState createState() => _QuestionsPanelState();
}

class _QuestionsPanelState extends State<QuestionsPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                'Question 1',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          body: const ListTile(
            title: Text(
              'Answer to question 1',
              style: TextStyle(color: Colors.white),
            ),
          ),
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}
