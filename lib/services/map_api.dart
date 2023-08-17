import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constant.dart';
import '../widget/colors.dart';

class MapApi {
  bool servicestatus = false;
  bool haspermission = false;
  Position locationPosition = Position(
    accuracy: 50,
    altitude: 50,
    heading: 20,
    latitude: 6.4096,
    longitude: 7.4978,
    speed: 100,
    speedAccuracy: 80,
    timestamp: DateTime.now(),
  );
  Map<PolylineId, Polyline> polylines = {};

  final LatLng destination = const LatLng(6.3996, 7.5378);
  PolylinePoints polylinePoints = PolylinePoints();

  // display polyline inside the map
  void getPolyline({required LatLng destination}) async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(locationPosition.latitude, locationPosition.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
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
  }

  // check user Gps cordinate location,
  // onces a user open the application
  Future checkGps(context) async {
    late LocationPermission permission;

    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationPosition =
              await Geolocator.getLastKnownPosition() as Position;
          //destination = newDestination;
          //notifyListeners();
        } else if (permission == LocationPermission.deniedForever) {
          //print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        locationPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);

        //notifyListeners();

        late LocationSettings locationSettings;

        if (defaultTargetPlatform == TargetPlatform.android) {
          locationSettings = AndroidSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
            forceLocationManager: true,
            //intervalDuration: const Duration(seconds: 10),
            //(Optional) Set foreground notification config to keep the app alive
            //when going to the background
            // foregroundNotificationConfig: const ForegroundNotificationConfig(
            //   notificationText: "Akive is updating your location",
            //   notificationTitle: "Tracking",
            //   enableWakeLock: true,
            // ),
          );
        } else if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS) {
          locationSettings = AppleSettings(
            accuracy: LocationAccuracy.high,
            activityType: ActivityType.fitness,
            distanceFilter: 100,
            pauseLocationUpdatesAutomatically: true,
            // Only set to true if our app will be started up in the background.
            showBackgroundLocationIndicator: true,
          );
        } else {
          locationSettings = const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
          );
        }

        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
          locationPosition = position;
          getPolyline(destination: destination);
          // notifyListeners();
        });
      }
    } else {
      //locationNotice(context);
    }

    //notifyListeners();
  }
}
