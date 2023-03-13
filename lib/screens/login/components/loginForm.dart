import 'package:flutter/material.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: secondaryBackground,
              borderRadius: BorderRadius.circular(50.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: bodyTextColor),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please enter your email';
                } else if (value.isEmpty) {
                  return 'Please enter a valid email';
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
            margin: const EdgeInsets.only(top: 18),
            decoration: BoxDecoration(
              color: secondaryBackground,
              borderRadius: BorderRadius.circular(50.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                hintStyle: TextStyle(color: bodyTextColor),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please enter your email';
                } else if (value.isEmpty) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: MainButton(
              text: 'Ingresar',
              isPrimary: true,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
