import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/services/authentication.service.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _passwordRecoveryFormKey = GlobalKey<FormState>();
  String _email = '';
  bool _isLoading = false;

  Future<void> _submitForm(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    final form = _passwordRecoveryFormKey.currentState;
    if (form!.validate()) {
      form.save();
    }

    try {
      final res = await AuthService.instance.recoverPassword(_email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: greenPrimaryColor,
          content: Text(
            'Se ha enviado un correo electrónico a la dirección proporcionada con instrucciones para restablecer su contraseña.',
            style: TextStyle(color: Colors.black),
          ),
          showCloseIcon: true,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: errorColor,
          content: Text(
            'Error: $e',
            style: const TextStyle(color: Colors.white70),
          ),
          showCloseIcon: true,
        ),
      );
      return;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // align children to the left
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Por favor ingresa tu email:',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )),
          Center(
            child: Form(
              key: _passwordRecoveryFormKey,
              child: Column(
                children: [
                  TextFormField(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: MainButton(
                      isLoading: _isLoading,
                      text: 'Enviar',
                      isPrimary: true,
                      onPressed: () async => await _submitForm(context),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
