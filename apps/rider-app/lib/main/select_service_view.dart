import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/generated/l10n.dart';
import '../graphql/generated/graphql_api.dart';
import '../main/service_item_view.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectServiceView extends StatefulWidget {
  const SelectServiceView(
      {Key? key, required this.data, required this.onServiceSelect})
      : super(key: key);
  final CalculateFare$Mutation$CalculateFareDTO data;
  final ServiceSelectCallback onServiceSelect;

  @override
  _SelectServiceViewState createState() => _SelectServiceViewState();
}

class _SelectServiceViewState extends State<SelectServiceView> {
  String? selectedServiceId;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTabController(
                length: widget.data.services.length,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _tabSection(context, widget.data.services),
                  ],
                )),
            Row(
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(14)),
                    onPressed: () {
                      _selectTime(context);
                    },
                    child: const Icon(Icons.calendar_today_outlined)),
                const SizedBox(width: 10),
                Expanded(
                  child: Mutation(
                    options: MutationOptions(
                        document: CREATE_ORDER_MUTATION_DOCUMENT),
                    builder: (RunMutation runMutation, QueryResult? result) {
                      return ElevatedButton(
                          onPressed: selectedServiceId == null
                              ? null
                              : () async {
                                  if (selectedServiceId == null) {
                                    return;
                                  }
                                  int minutesFromNow = 0;
                                  if (selectedTime != null) {
                                    final now = DateTime.now();
                                    final selectedDateTime = DateTime(
                                        now.year,
                                        now.month,
                                        now.day,
                                        selectedTime!.hour,
                                        selectedTime!.minute);
                                    minutesFromNow = selectedDateTime
                                        .difference(now)
                                        .inMinutes;
                                  }
                                  widget.onServiceSelect(
                                      selectedServiceId!, minutesFromNow);
                                },
                          child: Text(
                            selectedTime == null
                                ? S.of(context).service_selection_book_now
                                : S.of(context).service_selection_book_later(
                                    selectedTime!.hour, selectedTime!.minute),
                          ));
                    },
                  ),
                )
              ],
            ).pOnly(top: 10)
          ],
        ),
      ),
    );
  }

  Widget _tabSection(BuildContext context,
      List<CalculateFare$Mutation$CalculateFareDTO$ServiceCategory> data) {
    return DefaultTabController(
      length: data.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade100,
            ),
            child: Visibility(
              maintainState: true,
              visible: data.length > 1,
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: TabBar(
                    indicator: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    tabs: data
                        .map((e) => Tab(
                              text: e.name,
                            ))
                        .toList()),
              ),
            ),
          ),
          SizedBox(
            height: 135,
            child: TabBarView(
              children: data.map((e) {
                return Container(child: _serviceTileList(context, e.services));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceTileList(
      BuildContext context,
      List<CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service>
          services) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: services
          .map((e) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedServiceId = e.id;
                  });
                },
                child: ServiceItemView(
                  service: e,
                  isSelected: e.id == selectedServiceId,
                  currency: widget.data.currency,
                ),
              ))
          .toList(),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime ?? TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child ?? Container(),
          );
        });

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}

typedef ServiceSelectCallback = void Function(
    String serviceId, int intervalMinutes);
