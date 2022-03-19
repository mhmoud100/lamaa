import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import '../../graphql/generated/graphql_api.dart';

// Events
abstract class MainBlocEvent {}

class AddPoint extends MainBlocEvent {
  SelectedPoint point;

  AddPoint({required this.point});
}

class DropLastPoint extends MainBlocEvent {}

class MapMoved extends MainBlocEvent {
  LatLng latlng;

  MapMoved(this.latlng);
}

class ResetState extends MainBlocEvent {}

class DriverLocationUpdatedEvent extends MainBlocEvent {
  PointMixin location;

  DriverLocationUpdatedEvent(this.location);
}

class ShowPreview extends MainBlocEvent {
  List<SelectedPoint> points;
  CalculateFare$Mutation$CalculateFareDTO calculateFareResult;

  ShowPreview({required this.points, required this.calculateFareResult});
}

class OrderUpdated extends MainBlocEvent {
  CurrentOrderMixin order;
  PointMixin? driverLocation;

  OrderUpdated({required this.order, this.driverLocation});
}

class SetDriversLocations extends MainBlocEvent {
  List<LatLng> driversLocations;

  SetDriversLocations(this.driversLocations);
}

// States
abstract class MainBlocState {
  List<MarkerData> markers;
  bool isInteractive;

  MainBlocState({required this.isInteractive, required this.markers});
}

class SelectingPoints extends MainBlocState {
  List<SelectedPoint> points = [];
  List<LatLng> driverLocations = [];
  bool loadDrivers;

  SelectingPoints(this.points, this.driverLocations, this.loadDrivers)
      : super(
            isInteractive: true,
            markers: points
                .take(1)
                .map((e) => MarkerData(e.point.latitude.toString(), e.point,
                    'images/marker_pickup.png', MarkerType.pickup))
                .followedBy(points.skip(1).map((e) => MarkerData(
                    e.point.latitude.toString(),
                    e.point,
                    'images/marker_destination.png',
                    MarkerType.destination)))
                .followedBy(driverLocations
                    .map((e) => MarkerData(e.latitude.toString(), e,
                        'images/marker_taxi.png', MarkerType.driver))
                    .toList())
                .toList());
}

class OrderPreview extends MainBlocState {
  List<SelectedPoint> points = [];
  CalculateFare$Mutation$CalculateFareDTO fareResult;

  OrderPreview(this.points, this.fareResult)
      : super(
            isInteractive: false,
            markers: points
                .take(1)
                .map((e) => MarkerData(e.point.latitude.toString(), e.point,
                    'images/marker_pickup.png', MarkerType.pickup))
                .followedBy(points.skip(1).map((e) => MarkerData(
                    e.point.latitude.toString(),
                    e.point,
                    'images/marker_destination.png',
                    MarkerType.destination)))
                .toList());
}

class OrderLooking extends MainBlocState {
  CurrentOrderMixin currentOrder;

  OrderLooking(this.currentOrder) : super(isInteractive: false, markers: []);
}

class OrderInProgress extends MainBlocState {
  CurrentOrderMixin currentOrder;
  LatLng? driverLocation;

  OrderInProgress(this.currentOrder, {this.driverLocation})
      : super(isInteractive: false, markers: []) {
    switch (currentOrder.status) {
      case OrderStatus.driverAccepted:
      case OrderStatus.arrived:
        markers = [
          MarkerData(
              currentOrder.points[0].lat.toString(),
              LatLng(currentOrder.points[0].lat, currentOrder.points[0].lng),
              'images/marker_pickup.png',
              MarkerType.pickup)
        ];
        break;

      case OrderStatus.started:
        markers = currentOrder.points
            .sublist(1)
            .map((point) => MarkerData(
                point.lat.toString(),
                LatLng(point.lat, point.lng),
                'images/marker_destination.png',
                MarkerType.destination))
            .toList();
        break;

      default:
    }
    if (driverLocation != null) {
      markers.add(MarkerData(driverLocation!.latitude.toString(),
          driverLocation!, 'images/marker_taxi.png', MarkerType.driver));
    }
  }
}

class OrderInvoice extends MainBlocState {
  CurrentOrderMixin currentOrder;

  OrderInvoice(this.currentOrder) : super(isInteractive: false, markers: []);
}

class OrderReview extends MainBlocState {
  CurrentOrderMixin currentOrder;

  OrderReview(this.currentOrder) : super(isInteractive: false, markers: []);
}

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBloc() : super(SelectingPoints([], [], true)) {
    on<AddPoint>((event, emit) => emit(SelectingPoints(
        (state as SelectingPoints).points.followedBy([event.point]).toList(),
        (state as SelectingPoints).driverLocations,
        false)));

    on<DropLastPoint>((event, emit) {
      (state as SelectingPoints).points.removeLast();
      emit(SelectingPoints((state as SelectingPoints).points,
          (state as SelectingPoints).driverLocations, false));
    });

    on<MapMoved>((event, emit) {
      emit(SelectingPoints((state as SelectingPoints).points, [], true));
    });

    on<ResetState>((event, emit) => emit(SelectingPoints([], [], true)));

    on<ShowPreview>((event, emit) =>
        emit(OrderPreview(event.points, event.calculateFareResult)));

    on<OrderUpdated>((event, emit) {
      LatLng? driverLocation = event.driverLocation != null
          ? LatLng(event.driverLocation!.lat, event.driverLocation!.lng)
          : null;
      if (driverLocation == null &&
          state is OrderInProgress &&
          (state as OrderInProgress).driverLocation != null) {
        driverLocation = (state as OrderInProgress).driverLocation;
      }

      if (state is OrderInProgress) {}
      switch (event.order.status) {
        case OrderStatus.requested:
        case OrderStatus.notFound:
        case OrderStatus.noCloseFound:
        case OrderStatus.found:
        case OrderStatus.booked:
          emit(OrderLooking(event.order));
          return;

        case OrderStatus.driverAccepted:
        case OrderStatus.arrived:
        case OrderStatus.started:
        case OrderStatus.waitingForPrePay:
          emit(OrderInProgress(event.order, driverLocation: driverLocation));
          return;

        case OrderStatus.expired:
        case OrderStatus.finished:
        case OrderStatus.riderCanceled:
        case OrderStatus.driverCanceled:
        case OrderStatus.artemisUnknown:
          emit(SelectingPoints([], [], true));
          return;

        case OrderStatus.waitingForPostPay:
          emit(OrderInvoice(event.order));
          return;

        case OrderStatus.waitingForReview:
          emit(OrderReview(event.order));
          return;
      }
    });

    on<DriverLocationUpdatedEvent>((event, emit) {
      if (state is OrderInProgress) {
        emit(OrderInProgress((state as OrderInProgress).currentOrder,
            driverLocation: LatLng(event.location.lat, event.location.lng)));
      }
    });
    on<SetDriversLocations>((event, emit) => emit(SelectingPoints(
        (state as SelectingPoints).points, event.driversLocations, false)));
  }
}

class SelectedPoint {
  String address;
  LatLng point;

  SelectedPoint({required this.point, required this.address});
}

class MarkerData {
  String id;
  LatLng position;
  String assetAddress;
  MarkerType markerType;

  MarkerData(this.id, this.position, this.assetAddress, this.markerType);
}

enum MarkerType { pickup, destination, driver }
