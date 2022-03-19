import 'package:flutter/material.dart';
import 'package:ridy/generated/l10n.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectCurrencySheetView extends StatefulWidget {
  final List<Wallet$Query$RiderWallet> wallet;
  final Function(int index) selected;

  const SelectCurrencySheetView(this.wallet, this.selected, {Key? key})
      : super(key: key);

  @override
  State<SelectCurrencySheetView> createState() =>
      _SelectCurrencySheetViewState();
}

class _SelectCurrencySheetViewState extends State<SelectCurrencySheetView> {
  String? selectedId;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).wallet_select_currency).p4(),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.wallet.length,
            itemBuilder: (context, index) {
              return CurrencySheetItemView(widget.wallet[index], selectedId,
                  (String id) {
                setState(() {
                  selectedId = id;
                });
              });
            }),
        ElevatedButton.icon(
                onPressed: selectedId == null
                    ? null
                    : () {
                        widget.selected(widget.wallet
                            .indexWhere((element) => element.id == selectedId));
                        Navigator.pop(context);
                      },
                icon: const Icon(Icons.swap_horiz),
                label: Text(S.of(context).wallet_switch_currency))
            .pOnly(top: 4)
            .wFull(context)
      ],
    ).p4();
  }
}

class CurrencySheetItemView extends StatelessWidget {
  final Wallet$Query$RiderWallet item;
  final String? selectedId;
  final Function(String id) selectionChanged;

  const CurrencySheetItemView(this.item, this.selectedId, this.selectionChanged,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(10),
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.5,
            color: selectedId == item.id
                ? Theme.of(context).primaryColor
                : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Radio(
              value: item.id,
              groupValue: selectedId,
              onChanged: (String? index) => selectionChanged(index!)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                NumberFormat.simpleCurrency(name: item.currency)
                    .format(item.balance),
                style: const TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    ).pOnly(top: 4);
  }
}
