import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/CustomCheckbox.dart';
import 'package:playrr_app/controllers/auth.controller.dart';

class LevelList extends StatefulWidget {
  final List levelsData;
  const LevelList({super.key, required this.levelsData});

  @override
  State<LevelList> createState() => _LevelListState();
}

class _LevelListState extends State<LevelList> {
  final AuthController signUpController = Get.put(AuthController());

  String _selectedLevel = '';
  void saveLevel(value) {
    final pickedSportId = signUpController.currentSport.value;
    setState(() {
      _selectedLevel = value.toString();
    });
    signUpController.pickedLevelId(int.tryParse(_selectedLevel));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.levelsData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CustomCheckbox(
              label: widget.levelsData[index]['name'],
              value: widget.levelsData[index]['id'].toString(),
              groupValue: _selectedLevel,
              onChanged: (value) {
                saveLevel(value);
              },
            ));
      },
    );
  }
}
