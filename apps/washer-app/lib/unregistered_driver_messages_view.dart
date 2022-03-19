import 'graphql/generated/graphql_api.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UnregisteredDriverMessagesView extends StatelessWidget {
  final BasicProfileMixin driver;
  const UnregisteredDriverMessagesView({required this.driver, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (driver.status) {
      case DriverStatus.waitingDocuments:
        return const Center(
          child: Text("Complete Registration"),
        );
      case DriverStatus.blocked:
        return Center(
          child: const Text(
            "This account is blocked from providing services.",
            textAlign: TextAlign.center,
          ).p12(),
        );
      case DriverStatus.pendingApproval:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Your registration form was submitted and it is waiting for review.",
                textAlign: TextAlign.center,
              ).pOnly(left: 12, right: 12),
              const Text(
                "You can update your submission in case needed.",
                textAlign: TextAlign.center,
              ).pOnly(top: 4, bottom: 12, left: 12, right: 12),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "register"),
                  child: const Text("Update Profile"))
            ],
          ),
        );
      case DriverStatus.softReject:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                  "We found that there is an issue with your registration form. You can update your submission form and resubmit for review."),
              Text(driver.softRejectionNote ?? "No Description Provided"),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "register"),
                  child: const Text("Update Profile"))
            ],
          ),
        );
      case DriverStatus.hardReject:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "We found issues with your submission which are not suitable for our providers. Feel free to contact in case needed.",
                textAlign: TextAlign.center,
              ).p12(),
              Text(driver.softRejectionNote ?? "No Description Provided.")
            ],
          ),
        );
      default:
        return const Text("Unknown Unregistrered state");
    }
  }
}
