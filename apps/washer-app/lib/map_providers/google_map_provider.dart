import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;
import '../graphql/generated/graphql_api.dart';
import 'open_street_map_provider.dart';

// ignore: must_be_immutable
class GoogleMapProvider extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late BitmapDescriptor iconPickup;
  late BitmapDescriptor iconDestination;

  final Stream<geo.Position> streamServerLocation =
      geo.Geolocator.getPositionStream(
          distanceFilter: 50, intervalDuration: const Duration(seconds: 5));

  GoogleMapProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return Mutation(
        options:
            MutationOptions(document: UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          BitmapDescriptor.fromAssetImage(
                  const ImageConfiguration(size: Size(48, 48)),
                  'images/marker_destination.png')
              .then((onValue) {
            iconPickup = onValue;
          });

          return BlocConsumer<MainBloc, MainState>(
              listenWhen: (previous, next) =>
                  next is StatusOnline || next is StatusInService,
              listener: (context, state) async {
                geo.Geolocator.checkPermission().then((value) {
                  if (value == geo.LocationPermission.denied) {
                    geo.Geolocator.requestPermission();
                  }
                });
                if (state.markers.isNotEmpty) {
                  final currentLocation = state is StatusOnline
                      ? state.currentLocation
                      : (state as StatusInService).currentLocation;
                  final points = state.markers
                      .map((e) =>
                          LatLng(e.position.latitude, e.position.longitude))
                      .followedBy(currentLocation != null
                          ? [
                              LatLng(currentLocation.latitude,
                                  currentLocation.longitude)
                            ]
                          : [])
                      .toList();
                  (await _controller.future).animateCamera(
                      CameraUpdate.newLatLngBounds(
                          boundsFromLatLngList(points), 100));
                }
                if (state is StatusOnline &&
                    state.orders.isEmpty &&
                    state.currentLocation != null) {
                  (await _controller.future).animateCamera(
                      CameraUpdate.newLatLngZoom(
                          LatLng(state.currentLocation!.latitude,
                              state.currentLocation!.longitude),
                          16));
                }
                if ((state is StatusOnline && state.currentLocation == null) ||
                    (state is StatusInService &&
                        state.currentLocation == null)) {
                  geo.Geolocator.getCurrentPosition()
                      .then((value) => onLocationUpdated(value, mainBloc));
                }
              },
              builder: (context, state) => Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        markers: state.markers
                            .map((e) => Marker(
                                markerId: MarkerId(e.id),
                                position: LatLng(
                                    e.position.latitude, e.position.longitude)))
                            .toSet(),
                      ),
                      if (state.driver!.status != DriverStatus.offline)
                        StreamBuilder<geo.Position>(
                            stream: streamServerLocation,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                onLocationUpdated(snapshot.data!, mainBloc);
                              }
                              return Container();
                            })
                    ],
                  ));
        });
  }
}

LatLngBounds boundsFromLatLngList(List<LatLng> list) {
  double? x0, x1, y0, y1;
  for (LatLng latLng in list) {
    if (x0 == null) {
      x0 = x1 = latLng.latitude;
      y0 = y1 = latLng.longitude;
    } else {
      if (latLng.latitude > (x1 ?? 0)) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > (y1 ?? 0)) y1 = latLng.longitude;
      if (latLng.longitude < (y0 ?? 0)) y0 = latLng.longitude;
    }
  }
  return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
}
