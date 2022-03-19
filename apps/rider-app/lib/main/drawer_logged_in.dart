import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/graphql/generated/graphql_api.dart';

import '../config.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerLoggedIn extends StatelessWidget {
  const DrawerLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(600)),
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Query(
            options: QueryOptions(document: GET_RIDER_QUERY_DOCUMENT),
            builder: (QueryResult result,
                {Future<QueryResult?> Function()? refetch,
                FetchMore? fetchMore}) {
              if (result.data == null) {
                return Container();
              }
              var rider = GetRider$Query.fromJson(result.data!).rider;
              if (rider == null) {
                return Container();
              }
              return Column(
                children: [
                  (rider.media?.address == null)
                      ? const CircleAvatar(
                          radius: 36,
                          backgroundImage:
                              AssetImage('images/default-user-image.png'))
                      : CircleAvatar(
                          radius: 36,
                          backgroundImage: NetworkImage(
                              serverUrl + (rider.media?.address ?? ''))),
                  Text(
                    "${rider.firstName ?? " "} ${rider.lastName ?? " "}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ).p8(),
                  Text(
                    "+${rider.mobileNumber}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Colors.white),
                  )
                ],
              );
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.star_rounded),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_saved_locations),
          onTap: () {
            Navigator.pushNamed(context, 'addresses');
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications_rounded),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_announcements),
          onTap: () {
            Navigator.pushNamed(context, 'announcements');
          },
        ),
        ListTile(
          leading: const Icon(Icons.history_rounded),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_trip_history),
          onTap: () {
            Navigator.pushNamed(context, 'history');
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_balance_wallet_rounded),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_wallet),
          onTap: () {
            Navigator.pushNamed(context, 'wallet');
          },
        ),
        // ListTile(
        //   leading: const Icon(Icons.card_giftcard_rounded),
        //   minLeadingWidth: 20.0,
        //   title: const Text('Coupons'),
        //   onTap: () {
        //     Navigator.pushNamed(context, 'coupons');
        //   },
        // ),
        // ListTile(
        //   leading: const Icon(Icons.receipt_long_rounded),
        //   minLeadingWidth: 20.0,
        //   title: const Text('Financial Records'),
        //   onTap: () {
        //     Navigator.pushNamed(context, 'financial-records');
        //   },
        // ),
        ListTile(
          leading: const Icon(Icons.person_rounded),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_profile),
          onTap: () {
            Navigator.pushNamed(context, 'profile');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info_rounded),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_about),
          onTap: () async {
            PackageInfo packageInfo = await PackageInfo.fromPlatform();
            showAboutDialog(
                context: context,
                applicationIcon: Image.asset(
                  'images/logo.png',
                  width: 100,
                  height: 100,
                ),
                applicationVersion: packageInfo.version,
                applicationName: S.of(context).app_name,
                applicationLegalese: S.of(context).copyright_notice);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_logout),
          onTap: () async {
            await Hive.box('user').delete('jwt');
            //exit(1);
          },
        )
      ]),
    );
  }
}
