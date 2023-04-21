import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/signup.controller.dart';
import 'package:get/get.dart';
import 'package:playrr_app/screens/post_signup/thirdStep/stepThree.screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final SignUpController signUpController = Get.put(SignUpController());

  int _age = 0;
  final _ageFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Bienvenido a nuestra comunidad!',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Text(
                'Contanos sobre vos, para una experienca personzalizada',
                style: TextStyle(color: bodyTextColor, fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                'Cual es tu edad?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: titleTextColor),
              ),
            ),
            Form(
                key: _ageFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Edad',
                        hintStyle: const TextStyle(color: bodyTextColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              color: greenPrimaryColor, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: secondaryBackground,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa una edad valida.';
                        }
                        if (int.parse(value) < 16) {
                          return 'Tienes que tener al menos 16 años';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        signUpController.setAge(int.parse(value!));
                      },
                      style: const TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: MainButton(
                          text: "Siguiente",
                          onPressed: () {
                            if (_ageFormKey.currentState?.validate() ?? false) {
                              _ageFormKey.currentState?.save();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const StepThree()));
                            }
                          },
                          isPrimary: true),
                    )
                  ],
                ))
          ]),
    );
  }
}
