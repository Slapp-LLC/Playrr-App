import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;

  const SecondaryAppBar({Key? key, this.title}) : super(key: key);

  @override
  _SecondaryAppBarState createState() => _SecondaryAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SecondaryAppBarState extends State<SecondaryAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: widget.title != null
          ? Text(
              widget.title!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          : null,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/SecondaryBackButton.svg'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
