import 'package:url_launcher/url_launcher.dart';

import 'config.dart';
import 'generated/l10n.dart';
import 'main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'graphql/generated/graphql_api.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusCardView extends StatelessWidget {
  final CurrentOrderMixin order;
  const OrderStatusCardView({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    return Container(
      constraints: const BoxConstraints(maxWidth: 430),
      child: Mutation(
          options:
              MutationOptions(document: UPDATE_ORDER_STATUS_MUTATION_DOCUMENT),
          builder: (RunMutation runMutation, QueryResult? result) {
            if (order.status == OrderStatus.waitingForPostPay) {
              return Card(
                child: Column(
                  children: [
                    Row(children: [
                      Text("Trip fee",
                          style: TextStyle(color: Colors.grey.shade600)),
                      const Spacer(),
                      Text(NumberFormat.simpleCurrency(name: order.currency)
                          .format(order.costBest))
                    ]).pOnly(left: 12, right: 12, top: 12, bottom: 4),
                    Row(children: [
                      Text("Subtotal",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          )),
                      const Spacer(),
                      Text(
                          NumberFormat.simpleCurrency(name: order.currency)
                              .format(order.costAfterCoupon - order.paidAmount),
                          style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 24,
                              fontWeight: FontWeight.bold))
                    ]).pOnly(left: 12, right: 12, top: 4, bottom: 4),
                    ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 30)),
                            onPressed: () {
                              updateCurrentOrderStatus(
                                  bloc, runMutation, OrderStatus.finished,
                                  cashPayment: (order.costAfterCoupon -
                                      order.paidAmount));
                            },
                            child: Text(S
                                .of(context)
                                .order_status_action_received_cash))
                        .px4()
                  ],
                ),
              );
            }
            return Column(
              children: [
                Row(
                  children: [
                    if (order.status == OrderStatus.driverAccepted ||
                        order.status == OrderStatus.arrived)
                      FloatingActionButton.extended(
                          heroTag: 'cancelFab',
                          onPressed: (result?.isLoading ?? false)
                              ? null
                              : () => updateCurrentOrderStatus(bloc,
                                  runMutation, OrderStatus.driverCanceled),
                          label: Text(S.of(context).action_cancel),
                          icon: const Icon(Icons.close)),
                    const Spacer(),
                    FloatingActionButton.extended(
                        heroTag: 'navigateFab',
                        onPressed: () => openMapsSheet(context, order),
                        label: Text(S.of(context).order_status_action_navigate),
                        icon: const Icon(Icons.navigation)),
                  ],
                ).p8(),
                Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          (order.rider.media?.address == null)
                              ? const CircleAvatar(
                                  radius: 36,
                                  backgroundImage: AssetImage(
                                      'images/default-user-image.png'))
                              : CircleAvatar(
                                  radius: 36,
                                  backgroundImage: NetworkImage(serverUrl +
                                      (order.rider.media?.address ?? ''))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${order.rider.firstName ?? "-"} ${order.rider.lastName ?? "-"}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              if (order.status == OrderStatus.driverAccepted)
                                Text.rich(TextSpan(
                                  text: S.of(context).order_status_expected_in,
                                  style: const TextStyle(color: Colors.black54),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: (order.etaPickup?.isBefore(
                                                    DateTime.now()) ??
                                                true)
                                            ? S
                                                .of(context)
                                                .order_status_expected_soon
                                            : "${order.etaPickup?.difference(DateTime.now()).inMinutes.toString()} mins",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                )).py(4),
                              if (order.status == OrderStatus.started)
                                Text.rich(TextSpan(
                                  text: 'Payment Status: ',
                                  style: const TextStyle(color: Colors.black54),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: order.paidAmount <
                                                order.costAfterCoupon
                                            ? S
                                                .of(context)
                                                .order_status_fee_unpaid
                                            : S
                                                .of(context)
                                                .order_status_fee_paid,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: order.paidAmount <
                                                    order.costAfterCoupon
                                                ? Colors.red
                                                : Colors.green)),
                                  ],
                                )).py(4)
                            ],
                          ).pOnly(left: 8),
                          const Spacer(),
                          if (order.status == OrderStatus.driverAccepted ||
                              order.status == OrderStatus.arrived)
                            Center(
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.green.shade100,
                                  shape: const CircleBorder(),
                                ),
                                child: IconButton(
                                  iconSize: 24,
                                  icon: const Icon(Icons.call),
                                  color: Colors.green,
                                  onPressed: () => launchUrl(context,
                                      "tel://${order.rider.mobileNumber}"),
                                ),
                              ),
                            ),
                          const SizedBox(
                            width: 15,
                          ),
                          if (order.status == OrderStatus.driverAccepted ||
                              order.status == OrderStatus.arrived)
                            Center(
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.amber.shade100,
                                  shape: const CircleBorder(),
                                ),
                                child: IconButton(
                                  iconSize: 24,
                                  icon: const Icon(Icons.message),
                                  color: Colors.amber,
                                  onPressed: () =>
                                      Navigator.pushNamed(context, 'chat'),
                                ),
                              ),
                            )
                        ],
                      ).px(8).py(16),
                      if (order.status == OrderStatus.driverAccepted)
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 30)),
                            onPressed: (result?.isLoading ?? false)
                                ? null
                                : () => updateCurrentOrderStatus(
                                    bloc, runMutation, OrderStatus.arrived),
                            child: Text(
                                S.of(context).order_status_action_arrived)),
                      if (order.status == OrderStatus.arrived)
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 30)),
                            onPressed: (result?.isLoading ?? false)
                                ? null
                                : () => updateCurrentOrderStatus(
                                    bloc, runMutation, OrderStatus.started),
                            child:
                                Text(S.of(context).order_status_action_start)),
                      if (order.status == OrderStatus.started)
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 30)),
                            onPressed: (result?.isLoading ?? false)
                                ? null
                                : () => updateCurrentOrderStatus(
                                    bloc, runMutation, OrderStatus.finished),
                            child: Text(
                                S.of(context).order_status_action_finished))
                    ],
                  ).px4(),
                ),
              ],
            );
          }),
    );
  }

  openMapsSheet(context, CurrentOrderMixin order) async {
    final availableMaps = await MapLauncher.installedMaps;
    String title = "Navigate to pickup point";
    Coords coords = Coords(order.points.first.lat, order.points.first.lng);
    if (order.status != OrderStatus.driverAccepted &&
        order.status != OrderStatus.arrived) {
      title = "Navigate to drop off point";
      coords = Coords(order.points.last.lat, order.points.last.lng);
    }
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Wrap(
              children: <Widget>[
                for (var map in availableMaps)
                  ListTile(
                    onTap: () => map.showMarker(
                      coords: coords,
                      title: title,
                    ),
                    title: Text(map.mapName),
                    leading: SvgPicture.asset(
                      map.icon,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  launchUrl(BuildContext context, String url) async {
    final _canLaunch = await canLaunch(url);
    if (!_canLaunch) {
      final snackBar =
          SnackBar(content: Text(S.of(context).message_cant_open_url));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    launch(url);
  }

  Future<void> updateCurrentOrderStatus(
      MainBloc bloc, RunMutation runMutation, OrderStatus orderStatus,
      {double? cashPayment}) async {
    final result = await runMutation(UpdateOrderStatusArguments(
                orderId: order.id,
                status: orderStatus,
                cashPayment: cashPayment ?? 0)
            .toJson())
        .networkResult;
    bloc.add(CurrentOrderUpdated(result!.data!['updateOneOrder']));
  }
}
