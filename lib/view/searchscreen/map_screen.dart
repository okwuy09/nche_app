import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nche/constant.dart';
import 'package:nche/services/map_api.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/popover.dart';
import 'package:nche/widget/style.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_dash/flutter_dash.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _googleMapController = Completer();

  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;

  BitmapDescriptor sourceLocationIcon = BitmapDescriptor.defaultMarker;

  // calculate distance between two coordinate
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

// calculate the extimated time between two coordinate
  String getTimeTaken(Position source, LatLng dest) {
    double kms = calculateDistance(
        source.latitude, source.longitude, dest.latitude, dest.longitude);
    double kmsPerMin = 0.5;
    double minsTaken = kms / kmsPerMin;
    var totalMinutes = minsTaken;
    if (totalMinutes < 60) {
      return "${totalMinutes.toStringAsFixed(2)}  Mins";
    } else {
      String minutes = (totalMinutes % 60).toStringAsFixed(0);
      minutes = minutes.length == 1 ? "0$minutes" : minutes;
      return '${(totalMinutes / 60).toStringAsFixed(2)} hr  $minutes  Mins';
    }
  }

  // List<Location> locations = [];
  final LatLng destination = const LatLng(6.3996, 7.5378);
  @override
  void initState() {
    MapApi().checkGps(context);
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await Provider.of<AppData>(context, listen: false).checkGps(context);
    // });
    // timer();
    getPolyline(destination: destination);
    setDestinationIcons();
    setSourceIcons();
    super.initState();
  }

  // timer() => Timer(const Duration(seconds: 30), () async {
  //       await Provider.of<AppData>(context, listen: false).checkGps(context);
  //     });

  void setDestinationIcons() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/location_map.png', 100);
    destinationIcon = BitmapDescriptor.fromBytes(markerIcon);
    setState(() {});
  }

  void setSourceIcons() async {
    final Uint8List markerIcon =
        await getBytesFromAsset(avatar('Avatar6'), 100);
    sourceLocationIcon = BitmapDescriptor.fromBytes(markerIcon);
    setState(() {});
  }

  // display polyline inside the map
  Map<PolylineId, Polyline> polylines = {};

  PolylinePoints polylinePoints = PolylinePoints();
  void getPolyline({required LatLng destination}) async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(MapApi().locationPosition.latitude,
          MapApi().locationPosition.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
        setState(() {});
      }
    } else {
      (result.errorMessage);
    }
    PolylineId id = const PolylineId("nche");
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColor.primaryColor,
      points: polylineCoordinates,
      width: 6,
      geodesic: true,
      jointType: JointType.round,
      endCap: Cap.roundCap,
      startCap: Cap.roundCap,
    );

    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //var provider = Provider.of<AppData>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10),
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
        ),
      ),
      body: SlidingUpPanel(
        color: AppColor.red,
        minHeight: size.height / 2.9,
        maxHeight: size.height / 2.0,
        renderPanelSheet: false,
        panel: Popover(
          mainAxisSize: MainAxisSize.min,
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User location
                        Row(
                          children: [
                            Image.asset(
                              avatar('Avatar6'),
                              width: 42,
                              height: 42,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Source Location',
                                  style: style.copyWith(
                                    fontSize: 11,
                                    color: AppColor.darkerGrey.withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                SizedBox(
                                  width: size.width / 1.32,
                                  child: Text(
                                    '9b Nza Street, Independent layout Enugu',
                                    style: style.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        // destination location
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 6,
                          ),
                          child: Dash(
                            direction: Axis.vertical,
                            length: 30,
                            dashLength: 4,
                            dashThickness: 2,
                            dashColor: AppColor.lightBlack.withOpacity(0.3),
                          ),
                        ),
                        //
                        Row(
                          children: [
                            const SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.location_on_rounded,
                              color: AppColor.black,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Destination',
                                  style: style.copyWith(
                                    fontSize: 11,
                                    color: AppColor.darkerGrey.withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                SizedBox(
                                  width: size.width / 1.32,
                                  child: Text(
                                    'Residency Hotels Enugu, Independence layout Enugu.',
                                    style: style.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  color: AppColor.lightBlack.withOpacity(0.1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width / 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estimated Distance & Time',
                        style: style.copyWith(
                          fontSize: 11,
                          color: AppColor.darkerGrey.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        ' ${getTimeTaken(
                          MapApi().locationPosition,
                          LatLng(
                            destination.latitude,
                            destination.longitude,
                          ),
                        )} (${"${calculateDistance(
                          MapApi().locationPosition.latitude,
                          MapApi().locationPosition.longitude,
                          // destination
                          destination.latitude,
                          destination.longitude,
                        ).toStringAsFixed(2)}km away"})',
                        style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: size.height * 0.6,
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
              zoomControlsEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  MapApi().locationPosition.latitude,
                  MapApi().locationPosition.longitude,
                ),
                zoom: 13.5,
              ),
              polylines: Set<Polyline>.of(polylines.values),
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
                Marker(
                  markerId: const MarkerId('destination'),
                  icon: destinationIcon,
                  position: LatLng(
                    MapApi().destination.latitude,
                    MapApi().destination.longitude,
                  ),
                ),
              },
              onMapCreated: ((controller) {
                //  controller.showMarkerInfoWindow(const MarkerId('source'));
                _googleMapController.complete(controller);
              }),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppColor.white,
        padding: const EdgeInsets.only(
          right: 15,
          left: 15,
          bottom: 25,
        ),
        child: MainButton(
          borderColor: Colors.transparent,
          backgroundColor: AppColor.primaryColor,
          child: Text(
            'Go Back',
            style: style.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.white,
            ),
          ),
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
