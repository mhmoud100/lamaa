// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/main/bloc/locations_cubit.dart';
import '../graphql/generated/graphql_api.dart';
import '../login/login_number_view.dart';
import 'bloc/main_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:velocity_x/velocity_x.dart';

class PointSelectionView extends StatelessWidget {
  List<GetAddresses$Query$RiderAddress>? addresses;
  PointSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
      return Mutation(
          options: MutationOptions(document: CALCULATE_FARE_MUTATION_DOCUMENT),
          builder: (RunMutation runMutation, QueryResult? result) {
            if ((state as SelectingPoints).points.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Query(
                      options:
                          QueryOptions(document: GET_ADDRESSES_QUERY_DOCUMENT),
                      builder: (QueryResult result,
                          {Future<QueryResult?> Function()? refetch,
                          FetchMore? fetchMore}) {
                        if (result.isLoading) {
                          return const LinearProgressIndicator();
                        }
                        final List<GetAddresses$Query$RiderAddress> addresses =
                            result.data == null
                                ? []
                                : GetAddresses$Query.fromJson(result.data!)
                                    .riderAddresses;
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: addresses.isEmpty
                                ? []
                                : addresses
                                    .getRange(0, addresses.length > 1 ? 2 : 1)
                                    .map((e) => Flexible(
                                          fit: FlexFit.tight,
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              final latlng = LatLng(
                                                  e.location.lat,
                                                  e.location.lng);
                                              context
                                                  .read<LocationsCubit>()
                                                  .goToLoadingState(latlng);
                                              context
                                                  .read<LocationsCubit>()
                                                  .goToLoadedState(e.details);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                onPrimary: Colors.black),
                                            label: Text(e.title),
                                            icon: Icon(
                                                mapAddressTypeToIcon(e.type)),
                                          ).px(2),
                                        ))
                                    .toList());
                      }),
                  SafeArea(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<LocationsCubit, LocationsState>(
                          builder: (context, locationsState) {
                            return ElevatedButton(
                                onPressed: locationsState.isLoading
                                    ? null
                                    : () async {
                                        if (Hive.box('user').get('jwt') ==
                                            null) {
                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              constraints: const BoxConstraints(
                                                  maxWidth: 600),
                                              builder: (context) {
                                                return const LoginNumberView();
                                              });
                                          return;
                                        }
                                        final newPoint = SelectedPoint(
                                            point: context
                                                .read<LocationsCubit>()
                                                .state
                                                .currentLocation!,
                                            address: context
                                                    .read<LocationsCubit>()
                                                    .state
                                                    .address ??
                                                "");
                                        mainBloc.add(AddPoint(point: newPoint));
                                        final List<PointInput> pInputs =
                                            (context.read<MainBloc>().state
                                                    as SelectingPoints)
                                                .points
                                                .map((e) => PointInput(
                                                    lat: e.point.latitude,
                                                    lng: e.point.longitude))
                                                .followedBy([
                                          PointInput(
                                              lat: newPoint.point.latitude,
                                              lng: newPoint.point.longitude)
                                        ]).toList();
                                        final argsJson = CalculateFareArguments(
                                                points: pInputs)
                                            .toJson();
                                        final mResult =
                                            await runMutation(argsJson)
                                                .networkResult;
                                        if (mResult?.hasException ?? false) {
                                          final message =
                                              showCalculateFareError(mResult
                                                  ?.exception
                                                  ?.graphqlErrors
                                                  .first
                                                  .message);
                                          final snackBar =
                                              SnackBar(content: Text(message));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          return;
                                        }
                                        final fareResult =
                                            CalculateFare$Mutation.fromJson(
                                                    mResult!.data!)
                                                .calculateFare;
                                        mainBloc.add(ShowPreview(
                                            points: state.points.followedBy(
                                                [newPoint]).toList(),
                                            calculateFareResult: fareResult));
                                      },
                                child: Text(S
                                    .of(context)
                                    .point_selection_final_destination));
                          },
                        ).pOnly(right: 4).expand(),
                        if (state.points.length < 3)
                          BlocBuilder<LocationsCubit, LocationsState>(
                            builder: (context, locationsState) {
                              return ElevatedButton(
                                  onPressed: locationsState.isLoading
                                      ? null
                                      : () async {
                                          final newPoint = SelectedPoint(
                                              point: context
                                                  .read<LocationsCubit>()
                                                  .state
                                                  .currentLocation!,
                                              address: context
                                                  .read<LocationsCubit>()
                                                  .state
                                                  .address!);
                                          mainBloc
                                              .add(AddPoint(point: newPoint));
                                        },
                                  child: Text(S
                                      .of(context)
                                      .point_selection_add_destination));
                            },
                          ).pOnly(left: 2).expand(),
                      ],
                    ).pOnly(top: 4),
                  )
                ],
              );
            }
            return SafeArea(
              child: BlocBuilder<LocationsCubit, LocationsState>(
                builder: (context, locationsState) {
                  return ElevatedButton(
                      onPressed: locationsState.isLoading
                          ? null
                          : () {
                              var address = locationsState.address;
                              if (address == null) {}
                              final newPoint = SelectedPoint(
                                  point: context
                                      .read<LocationsCubit>()
                                      .state
                                      .currentLocation!,
                                  address: address!);
                              mainBloc.add(AddPoint(point: newPoint));
                            },
                      child:
                          Text(S.of(context).point_selection_confirm_pickup));
                },
              ),
            );
          });
    });
  }

  String showCalculateFareError(String? error) {
    switch (error) {
      case "REGION_UNSUPPORTED":
        return "Region is not supported";

      case "NO_SERVICE_IN_REGION":
        return "No Service found in region";

      case "GqlAuthGuard":
        return "Require login";

      default:
        return "Unknown";
    }
  }

  LatLng pointToLatLng(CurrentOrderMixin$Point point) {
    return LatLng(point.lat, point.lng);
  }

  IconData mapAddressTypeToIcon(RiderAddressType type) {
    switch (type) {
      case RiderAddressType.home:
        return Icons.home;

      case RiderAddressType.work:
        return Icons.work;

      case RiderAddressType.partner:
        return Icons.favorite;

      case RiderAddressType.other:
        return Icons.location_on;

      case RiderAddressType.artemisUnknown:
        return Icons.location_on;
    }
  }
}
