import 'package:flutter/material.dart';

class AvatarImage extends StatefulWidget {
  final String photoUrl;
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
        border: Border.all(color: Colors.grey.shade400, width: 1),
        image: widget.photoUrl != null && widget.photoUrl.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(widget.photoUrl),
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
