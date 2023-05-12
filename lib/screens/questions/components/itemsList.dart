import 'package:playrr_app/screens/questions/components/item.dart';

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Question $index',
      expandedValue: 'Answer to question $index',
    );
  });
}
