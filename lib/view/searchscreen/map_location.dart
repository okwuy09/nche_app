import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nche/constant.dart';
import 'package:nche/services/map_api.dart';
import 'package:nche/view/searchscreen/map_screen.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'widget/news_report_widget.dart';

class MapLocation extends StatefulWidget {
  const MapLocation({Key? key}) : super(key: key);

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  final Completer<GoogleMapController> _googleMapController = Completer();

  BitmapDescriptor sourceLocationIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    MapApi().checkGps(context);

    setSourceIcons();
    super.initState();
  }

  void setSourceIcons() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/location_map.png', 125);
    sourceLocationIcon = BitmapDescriptor.fromBytes(markerIcon);

    setState(() {});
  }

  final String location = '9b Nza street, Independent layout';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    //var provider = Provider.of<AppData>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: FloatingActionButton(
                backgroundColor: AppColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  CupertinoIcons.arrow_left,
                  color: AppColor.black,
                  size: 23,
                ),
              )),
          Expanded(child: Container()), //button first

          Container(
              margin: const EdgeInsets.only(
                right: 30,
                top: 15,
              ),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MapScreen(),
                  ),
                ),
                backgroundColor: AppColor.primaryColor,
                child: Image.asset(
                  'assets/arrow_branch.png',
                  width: 23,
                  height: 23,
                  color: AppColor.white,
                ),
              )), // button second

          // Add more buttons here
        ],
      ),
      body: Container(
        width: double.infinity,
        //height: screenSize.height * 0.6,
        margin: const EdgeInsets.only(bottom: 6, top: 35),
        decoration: BoxDecoration(
          color: AppColor.lightGrey,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          child: GoogleMap(
            zoomControlsEnabled: false,
            compassEnabled: false,
            scrollGesturesEnabled: false,
            zoomGesturesEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                MapApi().locationPosition.latitude,
                MapApi().locationPosition.longitude,
              ),
              zoom: 16,
            ),
            polylines: Set<Polyline>.of(MapApi().polylines.values),
            markers: {
              // ignore: unnecessary_null_comparison
              Marker(
                markerId: const MarkerId('source'),
                icon: sourceLocationIcon, //sourceLocationIcon,
                position: LatLng(
                  MapApi().locationPosition.latitude,
                  MapApi().locationPosition.longitude,
                ),
              ),
            },
            onMapCreated: ((controller) {
              //controller.showMarkerInfoWindow(const MarkerId('source'));
              _googleMapController.complete(controller);
            }),
          ),
        ),
      ),
      bottomSheet: Container(
        height: screenSize.height / 3.5,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(
              borderColor: AppColor.grey,
              backgroundColor: AppColor.grey.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'See Reports from this location',
                      style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      CupertinoIcons.forward,
                      size: 20,
                      color: AppColor.black,
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => NewsAndReportWidget(
                    index: 1,
                    title: location.length > 30
                        ? '${location.substring(0, 30)}...'
                        : location,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MainButton(
              borderColor: AppColor.grey,
              backgroundColor: AppColor.grey.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'See News from this location',
                      style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      CupertinoIcons.forward,
                      size: 20,
                      color: AppColor.black,
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => NewsAndReportWidget(
                    index: 0,
                    title: location.length > 30
                        ? '${location.substring(0, 30)}...'
                        : location,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
