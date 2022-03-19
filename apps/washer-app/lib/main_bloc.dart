import 'graphql/generated/graphql_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

abstract class MainEvent {}

class DriverUpdated extends MainEvent {
  BasicProfileMixin driver;

  DriverUpdated(this.driver);
}

class AvailableOrdersUpdated extends MainEvent {
  dynamic orders;
  LatLng? location;

  AvailableOrdersUpdated(this.orders, {this.location});
}

class AvailabledOrderAdded extends MainEvent {
  Map<String, dynamic> order;

  AvailabledOrderAdded(this.order);
}

class AvailableOrderRemoved extends MainEvent {
  Map<String, dynamic> order;

  AvailableOrderRemoved(this.order);
}

class CurrentLocationUpdated extends MainEvent {
  LatLng position;

  CurrentLocationUpdated(this.position);
}

class SelectedOrderChanged extends MainEvent {
  int index;

  SelectedOrderChanged(this.index);
}

class CurrentOrderUpdated extends MainEvent {
  Map<String, dynamic> order;

  CurrentOrderUpdated(this.order);
}

abstract class MainState {
  BasicProfileMixin? driver;
  List<MarkerData> markers;

  MainState(this.driver, this.markers);
}

class StatusUnregistered extends MainState {
  StatusUnregistered(driver) : super(driver, []);
}

class StatusOffline extends MainState {
  StatusOffline(BasicProfileMixin? driver) : super(driver, []);
}

class StatusOnline extends MainState {
  List<AvailableOrderMixin> orders;
  AvailableOrderMixin? selectedOrder;
  LatLng? currentLocation;

  StatusOnline(
      {driver, required this.orders, this.selectedOrder, this.currentLocation})
      : super(
            driver,
            selectedOrder != null
                ? selectedOrder.points
                    .take(1)
                    .map((e) => MarkerData(
                        e.lat.toString(),
                        LatLng(e.lat, e.lng),
                        'images/marker_pickup.png',
                        MarkerType.pickup))
                    .followedBy(selectedOrder.points.skip(1).map((e) =>
                        MarkerData(
                            e.lat.toString(),
                            LatLng(e.lat, e.lng),
                            'images/marker_destination.png',
                            MarkerType.destination)))
                    .toList()
                : []);
}

class StatusInService extends MainState {
  LatLng? currentLocation;

  StatusInService(driver, {this.currentLocation}) : super(driver, []) {
    if (this.driver?.orders.nodes.isNotEmpty ?? false) {
      final order = this.driver?.orders.nodes[0];
      if (order!.status == OrderStatus.driverAccepted ||
          order.status == OrderStatus.arrived) {
        markers = [
          MarkerData(
              order.points[0].lat.toString(),
              LatLng(order.points[0].lat, order.points[0].lng),
              'images/marker_pickup.png',
              MarkerType.pickup)
        ];
      }
      if (order.status == OrderStatus.started) {
        markers = order.points
            .skip(1)
            .map<MarkerData>((e) => MarkerData(
                e.lat.toString(),
                LatLng(e.lat, e.lng),
                'images/marker_destination.png',
                MarkerType.destination))
            .toList();
      }
    }
  }
}

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(StatusOffline(null)) {
    on<DriverUpdated>((event, emit) {
      switch (event.driver.status) {
        case DriverStatus.online:
          emit(StatusOnline(driver: event.driver, orders: []));
          break;

        case DriverStatus.inService:
          emit(StatusInService(event.driver));
          break;

        case DriverStatus.offline:
          emit(StatusOffline(event.driver));
          break;

        case DriverStatus.blocked:
        case DriverStatus.waitingDocuments:
        case DriverStatus.pendingApproval:
        case DriverStatus.softReject:
        case DriverStatus.hardReject:
        case DriverStatus.artemisUnknown:
          emit(StatusUnregistered(event.driver));
      }
    });

    on<AvailableOrdersUpdated>((event, emit) {
      if (state is! StatusOnline) {
        return;
      }
      final LatLng? currentLocation;
      if (event.location != null) {
        currentLocation = event.location;
      } else {
        currentLocation = (state is StatusOnline)
            ? (state as StatusOnline).currentLocation
            : null;
      }
      if ((state as StatusOnline).orders.length == event.orders.length &&
          event.location == (state as StatusOnline).currentLocation) {
        return;
      }
      List<AvailableOrderMixin> orders = event.orders
          .map<AvailableOrders$Query$AvailableOrder>((orderObj) =>
              AvailableOrders$Query$AvailableOrder.fromJson(orderObj))
          .toList();
      emit(StatusOnline(
          driver: state.driver,
          orders: orders,
          selectedOrder: orders.length == 1 ? orders.first : null,
          currentLocation: currentLocation));
    });

    on<AvailabledOrderAdded>((event, emit) {
      if (state is StatusOnline) {
        if ((state as StatusOnline).orders.indexWhere((element) =>
                element.id.toInt() == event.order['orderCreated']['id']) ==
            -1) {
          final AvailableOrderMixin _created =
              AvailableOrders$Query$AvailableOrder.fromJson(
                  event.order['orderCreated'] as Map<String, dynamic>);
          (state as StatusOnline).orders.add(_created);
          emit(StatusOnline(
              driver: state.driver,
              orders: (state as StatusOnline).orders,
              selectedOrder: (state as StatusOnline).orders.length == 1
                  ? (state as StatusOnline).orders.first
                  : (state as StatusOnline).selectedOrder,
              currentLocation: (state as StatusOnline).currentLocation));
        }
      }
    });

    on<AvailableOrderRemoved>((event, emit) {
      if (state is StatusOnline) {
        final _updated =
            OrderRemoved$Subscription.fromJson(event.order).orderRemoved;
        if ((state as StatusOnline)
                .orders
                .indexWhere((element) => element.id == _updated.id) >
            -1) {
          (state as StatusOnline)
              .orders
              .removeWhere((element) => element.id == _updated.id);
          emit(StatusOnline(
              driver: state.driver,
              orders: (state as StatusOnline).orders,
              selectedOrder: (state as StatusOnline).selectedOrder,
              currentLocation: (state as StatusOnline).currentLocation));
        }
      }
    });

    on<SelectedOrderChanged>((event, emit) {
      if (state is StatusOnline) {
        emit(StatusOnline(
            driver: state.driver,
            orders: (state as StatusOnline).orders,
            selectedOrder: (state as StatusOnline).orders[event.index],
            currentLocation: (state as StatusOnline).currentLocation));
      }
    });

    on<CurrentLocationUpdated>((event, emit) {
      if (state is StatusOnline) {
        emit(StatusOnline(
            driver: state.driver,
            orders: (state as StatusOnline).orders,
            selectedOrder: (state as StatusOnline).selectedOrder,
            currentLocation: event.position));
      }
    });

    on<CurrentOrderUpdated>((event, emit) {
      final endedStatuses = [
        OrderStatus.riderCanceled,
        OrderStatus.driverCanceled,
        OrderStatus.finished,
        OrderStatus.waitingForReview
      ];
      final _order =
          BasicProfileMixin$DriverOrdersConnection$Order.fromJson(event.order);
      if (endedStatuses.contains(_order.status)) {
        state.driver!.status = DriverStatus.online;
        state.driver!.orders.nodes = [];
        emit(StatusOnline(driver: state.driver, orders: []));
      } else {
        if (state.driver!.orders.nodes.isEmpty) {
          state.driver!.orders.nodes.add(_order);
        } else {
          final _o = BasicProfileMixin$DriverOrdersConnection();
          _o.nodes = [_order];
          state.driver!.orders = _o;
        }
        LatLng? currentLocation;
        if (state is StatusOnline) {
          currentLocation = (state as StatusOnline).currentLocation;
        }
        emit(StatusInService(state.driver, currentLocation: currentLocation));
      }
    });
  }
}

class MarkerData {
  String id;
  LatLng position;
  String assetAddress;
  MarkerType markerType;

  MarkerData(this.id, this.position, this.assetAddress, this.markerType);
}

enum MarkerType { pickup, destination, driver }
