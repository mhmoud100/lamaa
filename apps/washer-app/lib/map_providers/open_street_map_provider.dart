import '../config.dart';
import '../main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import '../graphql/generated/graphql_api.dart';

// ignore: must_be_immutable
class OpenStreetMapProvider extends StatelessWidget {
  MapController mapController = MapController();
  final Stream<geo.Position> streamServerLocation =
      geo.Geolocator.getPositionStream(
          distanceFilter: 50, intervalDuration: const Duration(seconds: 5));

  final TileLayerOptions openStreepTileLayer = TileLayerOptions(
      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      subdomains: ['a', 'b', 'c'],
      maxNativeZoom: 18);

  final TileLayerOptions mapBoxTileLayer = TileLayerOptions(
      urlTemplate:
          "https://api.mapbox.com/styles/v1/$mapBoxUserId/$mapBoxTileSetId/tiles/256/{z}/{x}/{y}@2x?access_token=$mapBoxAccessToken",
      additionalOptions: {"access_token": mapBoxAccessToken},
      maxNativeZoom: 18);

  OpenStreetMapProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return Mutation(
        options:
            MutationOptions(document: UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          return FlutterMap(
            mapController: mapController,
            children: [
              if (mapProvider == MapProvider.openStreetMap)
                TileLayerWidget(
                  options: openStreepTileLayer,
                ),
              if (mapProvider == MapProvider.mapBox)
                TileLayerWidget(
                  options: mapBoxTileLayer,
                ),
              LocationMarkerLayerWidget(
                plugin: const LocationMarkerPlugin(
                    centerOnLocationUpdate: CenterOnLocationUpdate.first),
              ),
              BlocBuilder<MainBloc, MainState>(
                  builder: (context, state) => MarkerLayerWidget(
                      options: MarkerLayerOptions(
                          markers: state.markers
                              .map((e) => Marker(
                                  point: e.position,
                                  width: 48,
                                  height: 48,
                                  builder: (context) =>
                                      Image.asset(e.assetAddress)))
                              .toList()))),

              BlocConsumer<MainBloc, MainState>(
                listenWhen: (previous, next) =>
                    next is StatusOnline || next is StatusInService,
                listener: (context, state) {
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
                        .map((e) => e.position)
                        .followedBy(
                            currentLocation != null ? [currentLocation] : [])
                        .toList();
                    mapController.fitBounds(LatLngBounds.fromPoints(points),
                        options: const FitBoundsOptions(
                            padding: EdgeInsets.only(
                                top: 100, left: 50, right: 50, bottom: 400)));
                  }
                  if (state is StatusOnline &&
                      state.orders.isEmpty &&
                      state.currentLocation != null) {
                    mapController.move(state.currentLocation!, 16);
                  }
                  if ((state is StatusOnline &&
                          state.currentLocation == null) ||
                      (state is StatusInService &&
                          state.currentLocation == null)) {
                    geo.Geolocator.getCurrentPosition()
                        .then((value) => onLocationUpdated(value, mainBloc));
                  }
                },
                builder: (context, state) {
                  if (state is StatusOffline) {
                    return Container();
                  }
                  return Stack(
                    children: [
                      if (state is StatusOnline)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SafeArea(
                              minimum: EdgeInsets.only(
                                  bottom: state.orders.isEmpty ? 16.0 : 320,
                                  right: 16.0),
                              child: FloatingActionButton(
                                  onPressed: () {
                                    if (state.currentLocation == null) return;
                                    mapController.move(
                                        state.currentLocation!, 16);
                                  },
                                  child: const Icon(
                                    Icons.location_searching,
                                    color: Colors.white,
                                  ))),
                        ),
                      StreamBuilder<geo.Position>(
                          stream: streamServerLocation,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              onLocationUpdated(snapshot.data!, mainBloc);
                            }
                            return Container();
                          }),
                    ],
                  );
                },
              ),
              // if ((state is StatusOnline && state.orders.isEmpty) ||
              //     state is StatusOffline)
            ],
            options: MapOptions(
                maxZoom: 20,
                zoom: 16,
                interactiveFlags: InteractiveFlag.drag |
                    InteractiveFlag.flingAnimation |
                    InteractiveFlag.pinchMove |
                    InteractiveFlag.pinchZoom |
                    InteractiveFlag.doubleTapZoom),
          );
        });
  }
}

void onLocationUpdated(geo.Position position, MainBloc bloc) async {
  final _httpLink = HttpLink(
    serverUrl + "graphql",
  );
  final _authLink = AuthLink(
    getToken: () async => 'Bearer ${Hive.box('user').get('jwt')}',
  );
  Link _link = _authLink.concat(_httpLink);
  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
  final res = await client.mutate(MutationOptions(
      document: UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT,
      variables: UpdateDriverLocationArguments(
              point:
                  PointInput(lat: position.latitude, lng: position.longitude))
          .toJson(),
      fetchPolicy: FetchPolicy.noCache));
  bloc.add(AvailableOrdersUpdated(res.data!['updateDriversLocationNew'],
      location: LatLng(position.latitude, position.longitude)));
}
