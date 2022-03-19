import 'package:flutter/material.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class ServiceItemView extends StatelessWidget {
  final bool isSelected;
  final CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service service;
  final String currency;

  const ServiceItemView(
      {Key? key,
      required this.isSelected,
      required this.service,
      required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            serverUrl + service.media.address,
            width: 75,
            height: 75,
          ),
          Text(
            service.name,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : Colors.black),
          ),
          Text(
            NumberFormat.simpleCurrency(name: currency).format(service.cost),
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ).pOnly(top: 4)
        ],
      ),
    );
  }
}
