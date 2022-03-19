import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/generated/l10n.dart';
import '../graphql/generated/graphql_api.dart';
import '../query_result_view.dart';
import '../wallet/payment_method_sheet_view.dart';
import '../wallet/select_currency_sheet_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  int? selectedWalletIndex;
  PageController pageController = PageController(viewportFraction: 0.25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).menu_wallet)),
      body: Query(
          options: QueryOptions(document: WALLET_QUERY_DOCUMENT),
          builder: (QueryResult result,
              {Refetch? refetch, FetchMore? fetchMore}) {
            if (result.isLoading || result.hasException) {
              return QueryResultView(result);
            }
            final query = Wallet$Query.fromJson(result.data!);
            final wallet = query.riderWallets;
            final transactions = query.riderTransacions.edges;
            if (wallet.isNotEmpty && selectedWalletIndex == null) {
              selectedWalletIndex = 0;
            }
            final _w = wallet.isEmpty ? null : wallet[selectedWalletIndex ?? 0];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  NumberFormat.simpleCurrency(name: _w?.currency ?? "USD")
                      .format(_w?.balance ?? 0),
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w700),
                ).pOnly(top: 16, bottom: 4).centered(),
                if (wallet.length > 1)
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(S
                        .of(context)
                        .wallet_other_currencies_available(wallet.length - 1)),
                    TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  constraints:
                                      const BoxConstraints(maxWidth: 600),
                                  context: context,
                                  builder: (context) {
                                    return SelectCurrencySheetView(wallet,
                                        (index) {
                                      setState(() {
                                        selectedWalletIndex = index;
                                      });
                                    });
                                  });
                            },
                            child: Text(S.of(context).wallet_switch_currency))
                        .p4()
                  ]),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        constraints: const BoxConstraints(maxWidth: 600),
                        builder: (context) {
                          return PaymentMethodSheetView(
                              currency: wallet.isEmpty
                                  ? "USD"
                                  : wallet[selectedWalletIndex ?? 0].currency);
                        });
                  },
                  label: Text(S.of(context).wallet_add_credit),
                  icon: const Icon(Icons.add),
                ).wFull(context).pOnly(top: 8),
                Text(S.of(context).wallet_activities_heading,
                        style: Theme.of(context).textTheme.headline6)
                    .pOnly(top: 12, bottom: 4, left: 4)
                    .objectTopLeft(),
                if (transactions.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          return _buildWalletItem(
                              context, transactions[index].node);
                        }),
                  ),
                if (transactions.isEmpty)
                  Expanded(
                      child: Center(
                          child:
                              Text(S.of(context).wallet_empty_state_message))),
              ],
            );
          }).p8(),
    );
  }

  Widget _buildWalletItem(
      BuildContext context,
      Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
          item) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: ListTile(
        leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: (item.action == TransactionAction.recharge)
                    ? Colors.green.shade300
                    : Colors.grey.shade400,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Icon(
              getTransactionIcon(item),
              color: Colors.white,
            )),
        title: Text(
            item.action == TransactionAction.recharge
                ? getRechargeText(item.rechargeType!)
                : getDeductText(context, item.deductType!),
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        subtitle: Text(DateFormat('yyyy-MM-dd | kk:mm').format(item.createdAt),
            style: Theme.of(context).textTheme.overline),
        trailing: Text(
          (item.action == TransactionAction.recharge ? "+" : "") +
              NumberFormat.simpleCurrency(name: item.currency)
                  .format(item.amount),
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: item.action == TransactionAction.recharge
                  ? Colors.green.shade300
                  : Colors.grey.shade600),
        ),
      ),
    ).p4();
  }

  String getDeductText(
      BuildContext context, RiderDeductTransactionType deductType) {
    switch (deductType) {
      case RiderDeductTransactionType.orderFee:
        return S.of(context).enum_rider_transaction_deduct_order_fee;

      case RiderDeductTransactionType.withdraw:
        return S.of(context).enum_rider_transaction_deduct_withdraw;

      case RiderDeductTransactionType.correction:
        return S.of(context).enum_rider_transaction_deduct_correction;
      default:
        return S.of(context).enum_unknown;
    }
  }

  String getRechargeText(RiderRechargeTransactionType type) {
    switch (type) {
      case RiderRechargeTransactionType.bankTransfer:
        return S.of(context).enum_rider_transaction_recharge_bank_transfer;

      case RiderRechargeTransactionType.correction:
        return S.of(context).enum_rider_transaction_recharge_correction;

      case RiderRechargeTransactionType.gift:
        return S.of(context).enum_rider_transaction_recharge_gift;

      case RiderRechargeTransactionType.inAppPayment:
        return S.of(context).enum_rider_transaction_recharge_in_app_payment;

      default:
        return S.of(context).enum_unknown;
    }
  }

  IconData getTransactionIcon(
      Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
          transacion) {
    if (transacion.action == TransactionAction.recharge) {
      switch (transacion.rechargeType) {
        case RiderRechargeTransactionType.bankTransfer:
          return Icons.food_bank;

        case RiderRechargeTransactionType.gift:
          return Icons.card_giftcard_outlined;

        case RiderRechargeTransactionType.correction:
          return Icons.refresh;

        case RiderRechargeTransactionType.inAppPayment:
          return Icons.receipt;

        default:
          return Icons.explicit;
      }
    } else {
      switch (transacion.deductType) {
        case RiderDeductTransactionType.orderFee:
          return Icons.miscellaneous_services;

        default:
          return Icons.explicit_outlined;
      }
    }
  }
}
