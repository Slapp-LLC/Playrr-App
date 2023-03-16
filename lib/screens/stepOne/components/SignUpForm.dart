import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playrr_app/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = '';
  String _lastName = '';
  void _submitForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 9),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: secondaryBackground,
                hintText: 'Nombre',
                hintStyle: const TextStyle(color: bodyTextColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: greenPrimaryColor, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Por favor ingresa tu nombre';
                } else if (value.isEmpty) {
                  return 'Por favor ingresa un nombre valido';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 9),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: secondaryBackground,
                hintText: 'Apellido',
                hintStyle: const TextStyle(color: bodyTextColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: greenPrimaryColor, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Por favor ingresa tu nombre';
                } else if (value.isEmpty) {
                  return 'Por favor ingresa un apellido valido';
                }
                return null;
              },
              onSaved: (value) {
                _lastName = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: secondaryBackground,
                borderRadius: BorderRadius.circular(50)),
            margin: const EdgeInsets.symmetric(vertical: 9),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(color: bodyTextColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: greenPrimaryColor, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Por favor ingresa tu email';
                } else if (value.isEmpty) {
                  return 'Por favor ingresa un email valido';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: secondaryBackground,
                borderRadius: BorderRadius.circular(50)),
            margin: const EdgeInsets.symmetric(vertical: 9),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle: const TextStyle(color: bodyTextColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide:
                        const BorderSide(color: greenPrimaryColor, width: 2.0),
                  )),
              validator: (value) {
                if (value == null) {
                  return 'Por favor ingresa tu nombre';
                } else if (value.isEmpty) {
                  return 'Por favor ingresa un nombre valido';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
