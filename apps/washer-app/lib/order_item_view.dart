import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:geolocator/geolocator.dart';
import 'generated/l10n.dart';
import 'graphql/generated/graphql_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';

class OrderItemView extends StatelessWidget {
  final AvailableOrderMixin order;
  final OrderAcceptedCallback onAcceptCallback;
  final LatLng? driverLocation;
  const OrderItemView(
      {Key? key,
      required this.order,
      required this.driverLocation,
      required this.onAcceptCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final driverDistance = driverLocation == null
        ? order.distanceBest
        : (Geolocator.distanceBetween(
                driverLocation!.latitude,
                driverLocation!.longitude,
                order.points.first.lat,
                order.points.first.lng) /
            1000);

    return Card(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey.shade300),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2)),
                        child: const Icon(Icons.local_taxi_outlined)),
                    Expanded(
                      flex: (driverDistance * 1000).round(),
                      child: const DottedLine(
                        lineThickness: 4.0,
                      ),
                    ),
                    Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2)),
                            child: const Icon(Icons.person_outline))
                        .pOnly(right: 4),
                    Expanded(
                      flex: order.distanceBest.round(),
                      child: const DottedLine(
                        lineThickness: 4.0,
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2)),
                        child: const Icon(Icons.place_outlined))
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      driverLocation != null
                          ? "${driverDistance.toDoubleStringAsFixed()} km"
                          : "",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const Spacer(),
                    Text(
                      "${(order.distanceBest / 1000).toDoubleStringAsFixed()} km",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const Spacer()
                  ],
                )
              ],
            ).p8(),
          ).p4(),
          ...order.addresses.mapIndexed((e, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      child: Icon(
                        getIconByIndex(index, order.addresses.length),
                        size: 20,
                        color: Colors.white,
                      ),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700))
                            .w(230),
                        Text(
                            index == 0
                                ? S.of(context).available_order_pickup_location
                                : S
                                    .of(context)
                                    .available_order_dropoff_location,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300))
                      ],
                    ).pOnly(left: 8)
                  ],
                ).p4(),
                if (index < order.addresses.length - 1)
                  const DottedLine(
                          direction: Axis.vertical,
                          lineLength: 15,
                          lineThickness: 5.0,
                          dashLength: 4.0,
                          dashColor: Colors.black)
                      .pOnly(left: 14)
              ],
            );
          }).toList(),
          Row(
            children: [
              const Icon(Icons.account_balance_wallet),
              const SizedBox(width: 4),
              Text(S.of(context).available_order_cost,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300)),
              const SizedBox(
                width: 4,
              ),
              Text(
                NumberFormat.simpleCurrency(name: order.currency)
                    .format(order.costBest),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ).p8(),
          const Spacer(),
          ElevatedButton(
                  onPressed: () =>
                      onAcceptCallback(order.id.toInt().toString()),
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(S.of(context).available_order_action_accept),
                      const Spacer()
                    ],
                  ).p4())
              .p4()
        ],
      ),
    );
  }

  IconData getIconByIndex(int index, int length) {
    if (index == 0) {
      return Icons.keyboard_arrow_down;
    } else if (index == length - 1) {
      return Icons.keyboard_arrow_up;
    } else {}
    return Icons.more_vert;
  }
}

typedef OrderAcceptedCallback = void Function(String orderId);
