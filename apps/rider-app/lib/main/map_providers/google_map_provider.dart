import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/config.dart';
import 'package:ridy/main/bloc/locations_cubit.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:geolocator/geolocator.dart' as geo;

import '../bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../graphql/generated/graphql_api.dart';
import '../marker.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class GoogleMapProvider extends StatefulWidget {
  const GoogleMapProvider({Key? key}) : super(key: key);

  @override
  _GoogleMapProviderState createState() => _GoogleMapProviderState();
}

class _GoogleMapProviderState extends State<GoogleMapProvider> {
  final Completer<GoogleMapController> _controller = Completer();
  AnimatedMarkerController markerController = AnimatedMarkerController();
  LatLng? center;
  var pickupMarker = getBytesFromAsset('images/marker_pickup.png', 150);
  var destinationMarker =
      getBytesFromAsset('images/marker_destination.png', 150);
  var taxiMarker = getBytesFromAsset('images/marker_taxi.png', 150);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    geo.Geolocator.getLastKnownPosition().then((value) async {
      if (value == null) return;
      (await _controller.future).animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(value.latitude, value.longitude), zoom: 15),
        ),
      );
    });
    if (Platform.isAndroid) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    markerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<MainBloc>();
    var locationsCubit = context.read<LocationsCubit>();
    return Query(
        options: QueryOptions(
            document: GET_DRIVERS_LOCATION_QUERY_DOCUMENT,
            variables: GetDriversLocationArguments(
                    point: center == null
                        ? null
                        : PointInput(
                            lat: center!.latitude, lng: center!.longitude))
                .toJson()),
        builder: (QueryResult result,
                {Future<QueryResult?> Function()? refetch,
                FetchMore? fetchMore}) =>
            BlocListener<LocationsCubit, LocationsState>(
                listener: (context, state) async {},
                child: BlocConsumer<MainBloc, MainBlocState>(
                    listener: (context, state) async {
                      if (state is SelectingPoints && state.loadDrivers) {
                        refetch!().then((value) {
                          final mq =
                              GetDriversLocation$Query.fromJson(value!.data!)
                                  .getDriversLocation;
                          bloc.add(SetDriversLocations(mq
                              .map((e) => latlng.LatLng(e.lat, e.lng))
                              .toList()));
                        });
                      }
                      // if (state is SelectingPoints && state.driverLocations.isEmpty) {
                      //   final args = GetDriversLocationArguments(point: PointInput(lat: mapController.center.latitude, lng: mapController.center.longitude));
                      //   fetchMore!(FetchMoreOptions(updateQuery: null,document: GET_DRIVERS_LOCATION_QUERY_DOCUMENT, variables: args.toJson())).then((value) => {
                      //     bloc.add(SetDriversLocations(value.data))};));
                      // }
                      if (state is OrderPreview) {
                        (await _controller.future).animateCamera(
                            CameraUpdate.newLatLngBounds(
                                boundsFromLatLngList(state.points
                                    .map((e) => LatLng(
                                        e.point.latitude, e.point.longitude))
                                    .toList()),
                                100));
                      }
                      if (state is OrderInProgress) {
                        (await _controller.future).animateCamera(
                            CameraUpdate.newLatLngBounds(
                                boundsFromLatLngList(state.markers
                                    .map((e) => LatLng(e.position.latitude,
                                        e.position.longitude))
                                    .toList()),
                                100));
                      }
                      if (state is OrderInvoice) {
                        (await _controller.future).animateCamera(
                            CameraUpdate.newLatLngZoom(
                                LatLng(state.currentOrder.points.last.lat,
                                    state.currentOrder.points.last.lng),
                                16));
                      }
                    },
                    builder: (context, state) => Stack(children: [
                          FutureBuilder(
                            future: Future.wait(
                                [pickupMarker, destinationMarker, taxiMarker]),
                            builder: (builder,
                                    AsyncSnapshot<List<Uint8List>> snapshot) =>
                                GoogleMap(
                              initialCameraPosition: _kGooglePlex,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                              onCameraMove: (position) =>
                                  center = position.target,
                              onCameraMoveStarted: () {
                                markerController.startScrolling();
                              },
                              onCameraIdle: () async {
                                markerController.stopScrolling();
                                var locationsCubit =
                                    context.read<LocationsCubit>();
                                locationsCubit.goToLoadingState(latlng.LatLng(
                                    center!.latitude, center!.longitude));
                                final reverseSearchResult =
                                    await Nominatim.reverseSearch(
                                  lat: center?.latitude,
                                  lon: center?.longitude,
                                );
                                locationsCubit.goToLoadedState(
                                    reverseSearchResult.displayName);
                                bloc.add(MapMoved(latlng.LatLng(
                                    center!.latitude, center!.longitude)));
                              },
                              markers: state.markers
                                  .map((e) => Marker(
                                      markerId: MarkerId(e.id),
                                      icon: getMarkerBitmapDescriptorFromType(
                                          e.markerType, snapshot),
                                      position: LatLng(e.position.latitude,
                                          e.position.longitude)))
                                  .toSet(),
                              scrollGesturesEnabled: state.isInteractive,
                            ),
                          ),
                          BlocListener<LocationsCubit, LocationsState>(
                            listenWhen: (previos, current) {
                              return previos.currentLocation !=
                                      current.currentLocation &&
                                  current.currentLocation != null &&
                                  current.isLoading;
                            },
                            listener: (context, state) async {
                              (await _controller.future).moveCamera(
                                  CameraUpdate.newLatLng(LatLng(
                                      state.currentLocation!.latitude,
                                      state.currentLocation!.longitude)));
                            },
                            child: Container(),
                          ),
                          Visibility(
                            maintainState: true,
                            visible: state.isInteractive,
                            child: AnimatedMarker(
                              controller: markerController,
                            ).centered(),
                          ),
                          if (state is SelectingPoints)
                            FloatingActionButton(
                              heroTag: 'searchFab',
                              onPressed: () async {
                                void onError(
                                    PlacesAutocompleteResponse response) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(response.errorMessage ??
                                          'Unknown error'),
                                    ),
                                  );
                                }

                                Prediction? prediction =
                                    await PlacesAutocomplete.show(
                                        context: context,
                                        apiKey: placesApiKey,
                                        mode: Mode.overlay,
                                        onError: onError);
                                final _places = GoogleMapsPlaces(
                                  apiKey: placesApiKey,
                                  apiHeaders: await const GoogleApiHeaders()
                                      .getHeaders(),
                                );
                                if (prediction == null) return;

                                final detail = await _places
                                    .getDetailsByPlaceId(prediction.placeId!);
                                final geometry = detail.result.geometry!;
                                final placeLatLng = LatLng(
                                    geometry.location.lat,
                                    geometry.location.lng);
                                (await _controller.future).animateCamera(
                                    CameraUpdate.newLatLng(placeLatLng));
                                locationsCubit.goToLoadedState(
                                    prediction.description ?? "Unknown");
                              },
                              backgroundColor: Colors.white,
                              child: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            )
                                .objectTopRight()
                                .safeArea(minimum: const EdgeInsets.all(16)),
                        ]))));
  }
}

BitmapDescriptor getMarkerBitmapDescriptorFromType(
    MarkerType markerType, AsyncSnapshot<List<Uint8List>> snapshot) {
  if (snapshot.data == null) return BitmapDescriptor.defaultMarker;
  switch (markerType) {
    case MarkerType.pickup:
      return BitmapDescriptor.fromBytes(snapshot.data!.first);

    case MarkerType.destination:
      return BitmapDescriptor.fromBytes(snapshot.data![1]);

    case MarkerType.driver:
      return BitmapDescriptor.fromBytes(snapshot.data!.last);
  }
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ImageByteFormat.png))!
      .buffer
      .asUint8List();
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
