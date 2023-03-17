import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/services/authentication_service.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final FocusNode _focusNode = FocusNode();
  final _signUpFormKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = '';
  String _lastName = '';
  bool _isLoading = false;

  Future _submitForm() async {
    setState(() {
      _isLoading = true;
    });
    final form = _signUpFormKey.currentState;
    if (form!.validate()) {
      form.save();
    }
    await AuthService.instance
        .signUp(_email, _password, _name, _lastName, context);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
              child: Column(
            children: [
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
                      borderSide: const BorderSide(
                          color: greenPrimaryColor, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    } else if (!RegExp(r"^[a-zA-ZáéíóúñÁÉÍÓÚÑ\s]+$")
                        .hasMatch(value)) {
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
                margin: const EdgeInsets.symmetric(vertical: 10),
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
                      borderSide: const BorderSide(
                          color: greenPrimaryColor, width: 2.0),
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
                margin: const EdgeInsets.symmetric(vertical: 9),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 9),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    hintStyle: const TextStyle(color: bodyTextColor),
                    filled: true,
                    fillColor: secondaryBackground,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(
                          color: greenPrimaryColor, width: 2.0),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña.';
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
          )),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text(
                    'Paso 1 de 4',
                    style: TextStyle(color: bodyTextColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: MainButton(
                      isLoading: _isLoading,
                      text: 'Siguiente',
                      onPressed: () {
                        _submitForm();
                      },
                      isPrimary: true,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
