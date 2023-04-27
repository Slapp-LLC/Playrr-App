import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Map<String, dynamic>> _getMyData() async {
    final storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    try {
      final response = await Dio().get(
          '${dotenv.env['API_ENDPOINT']}/user/myProfile',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    _getMyData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMyData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: const Center(
              child: CircularProgressIndicator(
                color: greenPrimaryColor,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: const Center(
              child: Text(
                'Error loading event data',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          final userData = snapshot.data;
          return SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: userData?['photoUrl'] != null &&
                            userData?['photoUrl'].isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(userData?['photoUrl']),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage('assets/images/Avatar.png'),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '${userData?['name']} ${userData?['lastName']}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Bebas neue',
                          fontSize: 25),
                    )),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePaths.EditMyProfile);
                  },
                  icon: SvgPicture.asset('assets/icons/EditIcon.svg'),
                  label: const Text(
                    'Editar perfil',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        width: 1,
                        color: greenPrimaryColor.withOpacity(0.44),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 5),
                            child: Text(
                              'Sobre mi',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            userData?['bio'] ?? 'No bio yet.',
                            style: const TextStyle(
                                color: bodyTextColor, fontSize: 17),
                          )
                        ])),
              ],
            ),
          ));
        }
      },
    );
  }
}
