import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';

class AvatarImage extends StatefulWidget {
  final String? photoUrl;
  const AvatarImage({super.key, required this.photoUrl});

  @override
  State<AvatarImage> createState() => _AvatarImageState();
}

class _AvatarImageState extends State<AvatarImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: widget.photoUrl != null
            ? DecorationImage(
                image: NetworkImage(widget.photoUrl!),
                fit: BoxFit.cover,
              )
            : const DecorationImage(
                image: AssetImage('assets/images/Avatar.png'),
                fit: BoxFit.cover,
              ),
      ),
      child: const SizedBox(
        width: 50,
        height: 50,
      ),
    );
  }
}
