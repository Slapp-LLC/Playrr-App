import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/auth.controller.dart';
import 'package:playrr_app/services/authentication.service.dart';

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
  String _name = '';
  String _lastName = '';
  String _bio = '';
  bool _isLoading = false;

  Future<void> _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
    }

    // await AuthService.instance.updateProfile(_email, _name, _lastName, _bio);
    // await AuthService.instance.getCurrentUser(context);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _email = widget.email!;
    _name = widget.name;
    _lastName = widget.lastName;
    _bio = widget.bio!;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15),
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
                hintText: 'Nombre',
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
                  return 'Por favor ingresa un nombre valido.';
                }
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Por favor ingresa un nombre valido.';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
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
                  return 'Por favor ingresa un apellido valido.';
                }
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Por favor ingresa un apellido valido.';
                }
                return null;
              },
              onSaved: (value) {
                _lastName = value!;
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
              onSaved: (value) {
                _bio = value!;
              },
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: greenPrimaryColor,
                      minimumSize: const Size(200, 45)),
                  onPressed: _submitForm,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.black),
                            value: null, // set to null to use the default size
                            strokeWidth: 2.0,
                          ),
                        )
                      : const Text(
                          'Guardar cambios',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )))
        ],
      ),
    );
  }
}
