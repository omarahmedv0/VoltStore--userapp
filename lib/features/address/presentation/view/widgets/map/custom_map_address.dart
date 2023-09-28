import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../view_model/map_cubit/map_cubit.dart';
import '../../../view_model/map_cubit/map_state.dart';

class CustomMapAddress extends StatelessWidget {
  const CustomMapAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) => GoogleMap(
        markers: MapCubit.get(context).markers.toSet(),
        onTap: (latLng) {
          MapCubit.get(context).addMarkers(latLng);
        },
        mapType: MapType.normal,
        initialCameraPosition: MapCubit.get(context).kGooglePlex!,
        onMapCreated: (GoogleMapController controller) {
          MapCubit.get(context).controller.complete(controller);
        },
      ),
    );
  }
}
