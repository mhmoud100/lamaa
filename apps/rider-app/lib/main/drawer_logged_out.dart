import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ridy/generated/l10n.dart';
import '../login/login_number_view.dart';

class DrawerLoggedOut extends StatelessWidget {
  const DrawerLoggedOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(600)),
      child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.black),
          child: Text(''),
        ),
        ListTile(
          leading: const Icon(Icons.login),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_login),
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                constraints: const BoxConstraints(maxWidth: 600),
                builder: (context) {
                  return const LoginNumberView();
                });
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
        )
      ]),
    );
  }
}
