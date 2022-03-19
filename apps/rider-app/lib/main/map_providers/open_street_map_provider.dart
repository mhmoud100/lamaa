import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/main/bloc/locations_cubit.dart';
import '../../config.dart';
import '../../graphql/generated/graphql_api.dart';
import '../bloc/main_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../marker.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';

import '../place_search_dialog_view.dart';

class OpenStreetMapProvider extends StatefulWidget {
  const OpenStreetMapProvider({Key? key}) : super(key: key);

  @override
  OpenStreetMapState createState() => OpenStreetMapState();
}

class OpenStreetMapState extends State<OpenStreetMapProvider>
    with TickerProviderStateMixin {
  final MapController mapController = MapController();
  AnimatedMarkerController markerController = AnimatedMarkerController();
  late StreamSubscription<MapEvent> subscription;
  LatLng? center;

  @override
  void initState() {
    var mainBloc = context.read<MainBloc>();
    var locationsCubit = context.read<LocationsCubit>();
    Geolocator.getCurrentPosition().then((value) async {
      locationsCubit.goToLoadingState(LatLng(value.latitude, value.longitude));
      final reverseSearchResult = await Nominatim.reverseSearch(
        lat: value.latitude,
        lon: value.longitude,
      );
      locationsCubit.goToLoadedState(reverseSearchResult.displayName);
      center = mapController.center;
      mainBloc.add(MapMoved(mapController.center));
    });

    mapController.onReady.then((value) {
      subscription =
          mapController.mapEventStream.listen((MapEvent mapEvent) async {
        if (mapEvent is MapEventMoveStart) {
          markerController.startScrolling();
        } else if (mapEvent is MapEventMoveEnd) {
          markerController.stopScrolling();
          locationsCubit.goToLoadingState(mapController.center);
          final reverseSearchResult = await Nominatim.reverseSearch(
            lat: mapController.center.latitude,
            lon: mapController.center.longitude,
          );
          locationsCubit.goToLoadedState(reverseSearchResult.displayName);
          center = mapController.center;
          mainBloc.add(MapMoved(mapController.center));
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    markerController.dispose();
    subscription.cancel();
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
            BlocConsumer<MainBloc, MainBlocState>(
                listener: (context, state) async {
                  if (state is SelectingPoints && state.loadDrivers) {
                    center = mapController.center;
                    var locations = await fetchMore!(FetchMoreOptions(
                        updateQuery: (previous, more) => more));
                    final mq =
                        GetDriversLocation$Query.fromJson(locations.data!)
                            .getDriversLocation;
                    bloc.add(SetDriversLocations(
                        mq.map((e) => LatLng(e.lat, e.lng)).toList()));
                  }
                  if (state is SelectingPoints && state.loadDrivers) {
                    final args = GetDriversLocationArguments(
                        point: PointInput(
                            lat: mapController.center.latitude,
                            lng: mapController.center.longitude));
                    fetchMore!(FetchMoreOptions(
                            updateQuery: (previous, more) => more,
                            document: GET_DRIVERS_LOCATION_QUERY_DOCUMENT,
                            variables: args.toJson()))
                        .then((value) {
                      var locations =
                          GetDriversLocation$Query.fromJson(value.data!);
                      var parsedLocs = locations.getDriversLocation
                          .map((e) => LatLng(e.lat, e.lng))
                          .toList();
                      bloc.add(SetDriversLocations(parsedLocs));
                    });
                  }
                  if (state is OrderPreview) {
                    mapController.onReady.then((value) =>
                        mapController.fitBounds(
                            LatLngBounds.fromPoints(
                                state.points.map((e) => e.point).toList()),
                            options: const FitBoundsOptions(
                                padding: EdgeInsets.only(
                                    top: 50,
                                    left: 50,
                                    right: 50,
                                    bottom: 400))));
                  }
                  if (state is OrderInProgress) {
                    mapController.onReady.then((value) {
                      if (state.markers.length == 1) {
                        mapController.move(state.markers.first.position, 16);
                      } else {
                        mapController.fitBounds(
                            LatLngBounds.fromPoints(
                                state.markers.map((e) => e.position).toList()),
                            options: const FitBoundsOptions(
                                padding: EdgeInsets.only(
                                    top: 50,
                                    left: 50,
                                    right: 50,
                                    bottom: 300)));
                      }
                    });
                  }
                  if (state is OrderInvoice) {
                    mapController.move(
                        LatLng(state.currentOrder.points.last.lat,
                            state.currentOrder.points.last.lng),
                        16);
                  }
                },
                builder: (context, state) => Stack(children: [
                      FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                            maxZoom: 20,
                            zoom: 16,
                            interactiveFlags: state.isInteractive
                                ? InteractiveFlag.drag |
                                    InteractiveFlag.flingAnimation |
                                    InteractiveFlag.pinchMove |
                                    InteractiveFlag.pinchZoom |
                                    InteractiveFlag.doubleTapZoom
                                : InteractiveFlag.none,
                            center: state.markers.length == 1
                                ? state.markers[0].position
                                : LatLng(37.3382, -121.8863)),
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
                            options: LocationMarkerLayerOptions(),
                            plugin: const LocationMarkerPlugin(
                                centerOnLocationUpdate:
                                    CenterOnLocationUpdate.first),
                          ),
                          MarkerLayerWidget(
                              options: MarkerLayerOptions(
                                  markers: state.markers
                                      .map((e) => Marker(
                                          point: e.position,
                                          width: 48,
                                          height: 48,
                                          builder: (context) =>
                                              Image.asset(e.assetAddress)))
                                      .toList())),
                          Visibility(
                            maintainState: true,
                            visible: state.isInteractive,
                            child: AnimatedMarker(
                              controller: markerController,
                            ).centered().pOnly(top: 30, left: 0),
                          ),
                          BlocListener<LocationsCubit, LocationsState>(
                            listenWhen: (previos, current) {
                              return previos.currentLocation !=
                                  current.currentLocation;
                            },
                            listener: (context, state) {
                              if (state.currentLocation == null) {
                                return;
                              }
                              mapController.move(
                                  state.currentLocation!, mapController.zoom);
                            },
                            child: Container(),
                          )
                        ],
                      ),
                      if (state is SelectingPoints)
                        FloatingActionButton(
                          heroTag: 'searchFab',
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return PlaceSearchDialogView((place) {
                                    mapController.move(
                                        LatLng(place.lat, place.lon), 16);
                                    locationsCubit
                                        .goToLoadedState(place.displayName);
                                  });
                                });
                          },
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        )
                            .objectTopRight()
                            .safeArea(minimum: const EdgeInsets.all(16)),
                    ])));
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final _latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final _lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
          _zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}

final TileLayerOptions openStreepTileLayer = TileLayerOptions(
    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
    subdomains: ['a', 'b', 'c'],
    maxNativeZoom: 18);

final TileLayerOptions mapBoxTileLayer = TileLayerOptions(
    urlTemplate:
        "https://api.mapbox.com/styles/v1/$mapBoxUserId/$mapBoxTileSetId/tiles/256/{z}/{x}/{y}@2x?access_token=$mapBoxAccessToken",
    additionalOptions: {"access_token": mapBoxAccessToken},
    maxNativeZoom: 18);
