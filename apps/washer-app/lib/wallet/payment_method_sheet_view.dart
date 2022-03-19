import 'package:ridy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

import '../query_result_view.dart';

class PaymentMethodSheetView extends StatefulWidget {
  const PaymentMethodSheetView({Key? key, required this.currency, this.amount})
      : super(key: key);
  final String currency;
  final double? amount;
  @override
  _PaymentMethodSheetViewState createState() => _PaymentMethodSheetViewState();
}

class _PaymentMethodSheetViewState extends State<PaymentMethodSheetView> {
  String? gatewayId;
  double selectedRechargeItem = 20;
  final rechargeAmounts = [10, 20, 50];
  late final TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController(
        text: (widget.amount ?? selectedRechargeItem.toString()).toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: PAYMENT_GATEWAYS_QUERY_DOCUMENT),
        builder: (QueryResult result,
            {Refetch? refetch, FetchMore? fetchMore}) {
          if (result.hasException || result.isLoading) {
            return QueryResultView(result);
          }
          final gateways =
              PaymentGateways$Query.fromJson(result.data!).paymentGateways;
          if (gateways.isEmpty) {
            return const Text("No Gateway is available.").centered();
          }
          gatewayId ??= gateways.first.id;
          return Mutation(
            options: MutationOptions(document: TOP_UP_WALLET_MUTATION_DOCUMENT),
            builder: (RunMutation runMutation, QueryResult? topUpResult) =>
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(S.of(context).wallet_select_payment_method).p4(),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: gateways.length,
                    itemBuilder: (context, index) {
                      return buildGatewayItem(context, gateways[index]);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: rechargeAmounts
                      .map((e) => buildRechargeItem(context, e))
                      .toList(),
                ),
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                      hintText: S.of(context).top_up_sheet_textfield_hint),
                ).p4().pOnly(top: 6),
                ElevatedButton.icon(
                        onPressed: (topUpResult?.isLoading ?? false)
                            ? null
                            : () async {
                                final mutationResult = await runMutation(
                                        TopUpWalletArguments(
                                                input: TopUpWalletInput(
                                                    gatewayId: gatewayId ?? "0",
                                                    amount:
                                                        selectedRechargeItem,
                                                    currency: widget.currency))
                                            .toJson())
                                    .networkResult;
                                final resultParsed =
                                    TopUpWallet$Mutation.fromJson(
                                        mutationResult!.data!);
                                launch(resultParsed.topUpWallet.url);
                                Navigator.pop(context);
                              },
                        icon: const Icon(Icons.check),
                        label: Text(S.of(context).top_up_sheet_pay_button))
                    .wFull(context)
                    .p4()
              ],
            ),
          );
        }).safeArea(minimum: const EdgeInsets.all(8));
  }

  Widget buildGatewayItem(
      BuildContext context, PaymentGateways$Query$PaymentGateway gateway) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(10),
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.5,
            color: gatewayId == gateway.id
                ? Theme.of(context).primaryColor
                : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Radio(
              value: gateway.id,
              groupValue: gatewayId,
              onChanged: (String? index) {
                setState(() {
                  gatewayId = index;
                });
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                gateway.title,
                style: const TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    ).pOnly(top: 4);
  }

  Widget buildRechargeItem(BuildContext context, int amount) {
    return GestureDetector(
      onTap: () {
        textController.text = amount.toString();
        setState(() {
          selectedRechargeItem = amount.toDouble();
        });
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(20),
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.5,
              color: selectedRechargeItem == amount
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NumberFormat.simpleCurrency(name: widget.currency)
                      .format(amount),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
      ).pOnly(top: 8, left: 4, right: 4),
    );
  }
}
