import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:playrr_app/components/CustomCheckbox.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/constants.dart';
import 'package:get/get.dart';
import 'package:playrr_app/controllers/signup.controller.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/SportPicking/sportPicking.screen.dart';
import 'package:playrr_app/services/authentication_service.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final SignUpController signUpController = Get.put(SignUpController());
  final userController = Get.find<UserController>();
  bool _isLoading = false;
  String selectedGender = '';

  void saveGender(value) {
    setState(() {
      selectedGender = value;
    });
    signUpController.setGender(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 29),
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Cual es tu genero?',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: titleTextColor,
                  fontSize: 25,
                  fontFamily: 'Bebas Neue'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.5),
              child: CustomCheckbox(
                label: 'Masculino',
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (value) {
                  saveGender(value);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.5),
              child: CustomCheckbox(
                label: 'Femenino',
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (value) {
                  saveGender(value);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.5),
              child: CustomCheckbox(
                label: 'No binario',
                value: 'NonBinary',
                groupValue: selectedGender,
                onChanged: (value) {
                  saveGender(value);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MainButton(
                text: 'Siguiente',
                isLoading: false,
                onPressed: () async {
                  String gender = signUpController.gender();
                  int age = signUpController.age();
                  setState(() {});
                  await AuthService.instance
                      .updateUser(age, gender, context)
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SportPickingScreen())));
                },
                isPrimary: true),
          )
        ],
      ),
    );
  }
}