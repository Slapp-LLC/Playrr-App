import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:playrr_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class LocationSection extends StatefulWidget {
  final String location;
  const LocationSection({super.key, required this.location});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  String? _mapStyle;
  GoogleMapController? _mapController;
  void _launchGoogleMaps() async {
    const String coordinates = '37.7749,-122.4194';

    const url =
        'https://www.google.com/maps/search/?api=1&query=$coordinates';

    final Uri urlFormatedd = Uri.parse(url);
    if (!await launchUrl(urlFormatedd)) {
      throw Exception('Could not launch $url');
    }
  }

  Set<Marker> _createMarkers() {
    return <Marker>{
      const Marker(
        markerId: MarkerId('marker_1'), // A unique identifier for the marker
        position: LatLng(37.7749, -122.4194), // The position of the marker
      )
    };
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.loadString('assets/map_styles.json').then((string) {
      setState(() {
        _mapStyle = string;
      });
    });
    print(_mapStyle);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (_mapStyle != null) {
      _mapController?.setMapStyle(_mapStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: secondaryBackground,
            width: 1.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 52,
                height: 52,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: greenPrimaryColor.withOpacity(0.33), width: 1)),
                child: Transform.scale(
                  scale: 0.75,
                  child: SvgPicture.asset(
                    'assets/icons/LocationGreenIcon.svg',
                  ),
                )),
            Expanded(
                child: GestureDetector(
              onTap: _launchGoogleMaps,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ubicacion',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          Text(
                            widget.location,
                            style: const TextStyle(color: bodyTextColor),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Transform.rotate(
                        angle: 180 * 3.14 / 180,
                        child: SvgPicture.asset(
                            'assets/icons/SecondaryBackButton.svg'),
                      ),
                    )
                  ]),
            ))
          ],
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 163,
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 17,
            ),
            buildingsEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false, // Disable zoom gestures
            scrollGesturesEnabled: false, // Disable scroll (panning) gestures
            rotateGesturesEnabled: false, // Disable rotate gestures
            tiltGesturesEnabled: false,
            gestureRecognizers: {
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              )
            },
            onMapCreated: _onMapCreated,
            markers: _createMarkers(),
          ),
        )
      ]),
    );
  }
}
