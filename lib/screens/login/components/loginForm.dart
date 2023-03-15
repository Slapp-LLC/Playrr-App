import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/screens/home/home.screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  // FlutterConfig.get('API_ENDPOINT');

  void _submitForm(BuildContext context) async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
    }
    try {
      final dio = Dio();
      final response = await dio.post(
          '${dotenv.env['API_ENDPOINT']}/auth/login',
          data: {'email': _email, 'password': _password});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = response.data;
        final token = jsonResponse['token'];
        final storage = new FlutterSecureStorage();
        await storage.write(key: 'token', value: token).then((value) =>
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Home())));
      } else {
        print('Works');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${response.statusCode}'),
        ));
      }
    } catch (e) {
      String errorMessage;
      if (e is DioError) {
        if (e.response?.statusCode == 400) {
          errorMessage = 'Email o contraseña inválidos';
        } else {
          errorMessage = 'Ha ocurrido un error, por favor intenta mas tarde.';
        }
      } else {
        errorMessage = 'Ha ocurrido un error, por favor intenta mas tarde.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: errorColor,
          content: Text(
            'Error: $errorMessage',
            style: const TextStyle(color: Colors.white70),
          ),
          showCloseIcon: true,
        ),
      );
    }
    // _handleLocalSignIn();
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
                  if (value == null) {
                    return 'Por favor ingresa un email valido.';
                  } else if (value.isEmpty) {
                    return 'Por favor ingresa un email valido.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 18),
            child: TextFormField(
              obscureText: true,
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
              onPressed: () => _submitForm(context),
            ),
          )
        ],
      ),
    );
  }
}
