import 'dart:async';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  static MapCubit get(context) {
    return BlocProvider.of(context);
  }

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  CameraPosition? kGooglePlex;

  final CameraPosition kLake = const CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  getDefaultLocation(context) async {
    emit(GetDefaultPositionLoading());
    kGooglePlex = const CameraPosition(
      target: LatLng(
        30.033333,
        31.233334,
      ),
      zoom: 17,
    );
    emit(GetDefaultPositionSuccess());
  }

  toAddressDetails(context) {
    if (lat == null || long == null) {
      customSnackBar(
        context,
        '160'.tr,
        AnimatedSnackBarType.info,
        30,
      );
    } else {
      toNamed(context, RouteManager.addAddressDetails, arguments: {
        'lat': lat.toString(),
        'long': long.toString(),
      });
    }
  }

  List<Marker> markers = [];
  double? lat;
  double? long;
  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: latLng,
      ),
    );
    lat = latLng.latitude;
    long = latLng.longitude;
    emit(
      AddMarker(),
    );
  }
}
