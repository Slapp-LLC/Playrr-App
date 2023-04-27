import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';

class UserDataForm extends StatefulWidget {
  final String? email;
  final String name;
  final String lastName;
  final String? bio;
  const UserDataForm(
      {super.key,
      required this.email,
      required this.name,
      required this.lastName,
      required this.bio});

  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        key: _formKey,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: TextFormField(
              initialValue: widget.email,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(color: bodyTextColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: greenPrimaryColor, width: 2.0),
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
                  return 'Por favor ingresa un email valido.';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Por favor ingresa un email valido.';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: TextFormField(
              initialValue: widget.name,
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: const TextStyle(color: bodyTextColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: greenPrimaryColor, width: 2.0),
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
                  return 'Por favor ingresa un email valido.';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Por favor ingresa un email valido.';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: TextFormField(
              initialValue: widget.lastName,
              decoration: InputDecoration(
                hintText: 'Apellido',
                hintStyle: const TextStyle(color: bodyTextColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: greenPrimaryColor, width: 2.0),
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
                  return 'Por favor ingresa un email valido.';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Por favor ingresa un email valido.';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: TextFormField(
              maxLines: 5,
              initialValue: widget.bio,
              decoration: InputDecoration(
                  hintText: 'Tell others about your sports',
                  hintStyle: const TextStyle(color: bodyTextColor),
                  fillColor: secondaryBackground,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: greenPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: greenPrimaryColor),
                onPressed: () {},
                child: const Text(
                  'Guardar cambios',
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
