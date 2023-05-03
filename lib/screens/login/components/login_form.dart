import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/auth.controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitForm(String email, String password) async {
    setState(() {
      _isLoading = true;
    });

    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
    }
    await _authController.login(
      email,
      password,
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              TextFormField(
                controller: _emailController,
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
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 18),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                hintStyle: const TextStyle(color: bodyTextColor),
                filled: true,
                fillColor: secondaryBackground,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: greenPrimaryColor, width: 2.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Por favor ingresa tu contraseña.';
                } else if (value.isEmpty) {
                  return 'Por favor ingresa un contraseña.';
                }
                return null;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: MainButton(
              isLoading: _isLoading,
              text: 'Ingresar',
              isPrimary: true,
              onPressed: () => {
                _submitForm(_emailController.text, _passwordController.text)
              },
            ),
          )
        ],
      ),
    );
  }
}
