import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ridy/generated/l10n.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/main_bloc.dart';

class DriverInfoCardView extends StatelessWidget {
  final CurrentOrderMixin order;

  const DriverInfoCardView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return Subscription(
        options: SubscriptionOptions(
            document: DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT),
        builder: (QueryResult result) {
          if (result.data != null) {
            final location =
                DriverLocationUpdated$Subscription.fromJson(result.data!);
            mainBloc.add(
                DriverLocationUpdatedEvent(location.driverLocationUpdated));
          }
          return Card(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      (order.driver?.media?.address == null)
                          ? const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('images/default-user-image.png'))
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(serverUrl +
                                  (order.driver?.media?.address ?? ''))),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${order.driver?.firstName} ${order.driver?.lastName}"
                                .toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ).px(5),
                          const SizedBox(height: 5),
                          if (order.status == OrderStatus.driverAccepted)
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 3),
                                Timeago(
                                  builder: (_, value) => Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 110),
                                    child: Text(
                                      value.toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                  date: order.etaPickup ?? DateTime.now(),
                                  allowFromNow: true,
                                ),
                              ],
                            ),
                          if (order.driver?.rating != null)
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  order.driver?.rating == null
                                      ? '-'
                                      : (order.driver!.rating! / 20)
                                          .toStringAsFixed(1),
                                  style: Theme.of(context).textTheme.caption,
                                )
                              ],
                            )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.network(
                            serverUrl + order.service.media.address,
                            width: 80,
                            height: 80,
                          ),
                          Text.rich(TextSpan(
                            text:
                                '${order.driver?.carColor?.name ?? '-'} ${order.driver?.car?.name ?? '-'} - ',
                            style: const TextStyle(color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                  text: order.driver?.carPlate,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          )),
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                          onPressed: () => launchUrl(
                              context, "tel://${order.driver?.mobileNumber}"),
                          icon: const Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                          label: Text(
                            S.of(context).driver_info_card_call,
                            style: const TextStyle(color: Colors.green),
                          ),
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(15))),
                      TextButton.icon(
                        onPressed: () => Navigator.pushNamed(context, 'chat'),
                        icon: const Icon(Icons.message, color: Colors.amber),
                        label: Text(
                          S.of(context).driver_info_card_message,
                          style: const TextStyle(color: Colors.amber),
                        ),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(15)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  launchUrl(BuildContext context, String url) async {
    final _canLaunch = await canLaunch(url);
    if (!_canLaunch) {
      const snackBar = SnackBar(content: Text("Command is not supported"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    launch(url);
  }
}
