import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/questions/components/item.dart';
import 'package:playrr_app/screens/questions/components/itemsList.dart';

class QuestionsBody extends StatefulWidget {
  const QuestionsBody({Key? key}) : super(key: key);

  @override
  _QuestionsBodyState createState() => _QuestionsBodyState();
}

class _QuestionsBodyState extends State<QuestionsBody> {
  List<Item> data = generateItems(10); // generate 10 questions

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        child: ExpansionPanelList(
          dividerColor: secondaryBackground,
          expandedHeaderPadding: const EdgeInsets.only(top: 0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              data[index].isExpanded = !isExpanded;
            });
          },
          expandIconColor: greenPrimaryColor,
          children: data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              canTapOnHeader: false,
              backgroundColor: Colors.black,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    item.headerValue,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
              body: ListTile(
                title: Text(
                  item.expandedValue,
                  style: const TextStyle(color: bodyTextColor),
                ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
