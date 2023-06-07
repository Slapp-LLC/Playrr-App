import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/event/components/coming_bar.dart';
import 'package:playrr_app/screens/event/components/join_bar.dart';

class BottomBar extends StatefulWidget {
  final int price;
  final int eventId;
  const BottomBar({super.key, required this.price, required this.eventId});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final UserProvider _userProvider = Get.find<UserProvider>();
  final EventsController _eventsController = Get.find<EventsController>();
  bool _isLoading = false;
  late bool _isAttending;

  bool isAttending(int eventId) {
    if (_userProvider.user.matches != null) {
      for (var match in _userProvider.user.matches!) {
        if (match['event']['id'] == eventId && match['status'] == 'attending') {
          return true;
        }
      }
    }
    return false;
  }

  Future<void> _onJoinEvent() async {
    try {
      await _eventsController.joinEvent(widget.eventId);
      setState(() {
        _isAttending = true;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isAttending = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _isAttending = isAttending(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: secondaryBackground,
              borderRadius: BorderRadius.circular(50)),
          //Todo make this conditional
          child: _isAttending
              ? const ComingBar()
              : JoinBar(
                  price: widget.price,
                  eventId: widget.eventId,
                  onJoinEvent: _onJoinEvent,
                ),
        ));
  }
}

class NoSpotsBar extends StatelessWidget {
  const NoSpotsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/SadFace.svg'),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            'NO HAY MAS LUGARES DISPONIBLES',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
