import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ridy/config.dart';
import 'package:ridy/main_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'generated/l10n.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(600)),
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state.driver == null) {
                return Container();
              }
              return Column(
                children: [
                  (state.driver?.media?.address == null)
                      ? const CircleAvatar(
                          radius: 36,
                          backgroundImage:
                              AssetImage('images/default-user-image.png'))
                      : CircleAvatar(
                          radius: 36,
                          backgroundImage: NetworkImage(serverUrl +
                              (state.driver?.media?.address ?? ''))),
                  Text(
                    "${state.driver?.firstName ?? " "} ${state.driver?.lastName ?? " "}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ).p8(),
                  Text(
                    state.driver?.mobileNumber != null
                        ? "+${state.driver?.mobileNumber}"
                        : "",
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
            Navigator.pushNamed(context, 'trip-history');
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
                applicationName: packageInfo.appName,
                applicationLegalese: S.of(context).copyright_notice);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_logout),
          onTap: () {
            Hive.box('user').delete('jwt');
          },
        )
      ]),
    );
  }
}
