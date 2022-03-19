import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ridy/generated/l10n.dart';
import 'bloc/main_bloc.dart';
import '../wallet/payment_method_sheet_view.dart';
import 'package:velocity_x/velocity_x.dart';

import 'apply_coupon_sheet_view.dart';

class OrderInvoiceCardView extends StatelessWidget {
  const OrderInvoiceCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
      return Card(
        child: Column(
          children: [
            Row(children: [
              Text(S.of(context).invoice_service_fee,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  )),
              const Spacer(),
              Text(NumberFormat.simpleCurrency(
                      name: (state as OrderInvoice).currentOrder.currency)
                  .format(state.currentOrder.costBest))
            ]).pOnly(left: 12, right: 12, top: 12, bottom: 8),
            if ((state.currentOrder.costBest) -
                    (state.currentOrder.costAfterCoupon) >
                0)
              Row(
                children: [
                  Text(S.of(context).invoice_coupon_discount,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      )),
                  const Spacer(),
                  Text(
                    NumberFormat.simpleCurrency(
                            name: state.currentOrder.currency)
                        .format((state.currentOrder.costBest) -
                            (state.currentOrder.costAfterCoupon)),
                    style: const TextStyle(color: Colors.green),
                  )
                ],
              ).pOnly(top: 4, bottom: 4, left: 12, right: 12),
            Row(children: [
              Text(S.of(context).invoice_subtotal,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 16,
                  )),
              const Spacer(),
              Text(
                  NumberFormat.simpleCurrency(name: state.currentOrder.currency)
                      .format((state.currentOrder.costAfterCoupon) -
                          (state.currentOrder.paidAmount)),
                  style: const TextStyle(color: Colors.amber, fontSize: 16))
            ]).pOnly(bottom: 4, left: 12, right: 12),
            const Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        constraints: const BoxConstraints(maxWidth: 600),
                        builder: (_context) {
                          return BlocProvider.value(
                            value: BlocProvider.of<MainBloc>(context),
                            child: const ApplyCouponSheetView(),
                          );
                        });
                  },
                  icon: const Icon(Icons.card_giftcard, color: Colors.blue),
                  label: Text(
                    S.of(context).invoice_apply_coupon_action,
                    style: const TextStyle(color: Colors.blue),
                  ),
                  style:
                      TextButton.styleFrom(padding: const EdgeInsets.all(15)),
                ),
                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        constraints: const BoxConstraints(maxWidth: 600),
                        builder: (context) {
                          return PaymentMethodSheetView(
                              currency: state.currentOrder.currency,
                              amount: state.currentOrder.costAfterCoupon);
                        });
                  },
                  icon: const Icon(Icons.payment, color: Colors.green),
                  label: Text(
                    S.of(context).invoice_pay_online_action,
                    style: const TextStyle(color: Colors.green),
                  ),
                  style:
                      TextButton.styleFrom(padding: const EdgeInsets.all(15)),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
