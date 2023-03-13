import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OuterLink extends StatelessWidget {
  final Uri url;
  final String text;
  const OuterLink({super.key, required this.url, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Roboto', fontSize: 17),
      ),
    );
  }
}
