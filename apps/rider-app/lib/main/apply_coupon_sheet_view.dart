import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/graphql/generated/graphql_api.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bloc/main_bloc.dart';

// ignore: must_be_immutable
class ApplyCouponSheetView extends StatefulWidget {
  const ApplyCouponSheetView({Key? key}) : super(key: key);

  @override
  State<ApplyCouponSheetView> createState() => _ApplyCouponSheetViewState();
}

class _ApplyCouponSheetViewState extends State<ApplyCouponSheetView> {
  String? errorText;
  final _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return SafeArea(
      minimum: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom + 8),
      child: Mutation(
          options: MutationOptions(
              document: APPLY_COUPON_MUTATION_DOCUMENT,
              fetchPolicy: FetchPolicy.noCache,
              update: (GraphQLDataProxy cache, QueryResult? result) {
                if (result!.hasException) {
                  setState(() {
                    errorText = result.exception?.graphqlErrors.first.message ??
                        "Unknown";
                  });
                  return;
                }
                final order =
                    ApplyCoupon$Mutation.fromJson(result.data!).applyCoupon;
                cache.writeQuery(
                    Operation(document: GET_CURRENT_ORDER_QUERY_DOCUMENT)
                        .asRequest(),
                    data: {
                      "currentOrderWithLocation": {
                        "order": result.data!['applyCoupon'],
                        "driverLocation": {"lat": 10, "lng": 10}
                      },
                    });
                mainBloc.add(OrderUpdated(order: order));
                Navigator.pop(context);
              }),
          builder: (RunMutation runMutation, QueryResult? result) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).coupon_heading).p4(),
                TextField(
                  controller: _text,
                  decoration: InputDecoration(
                      hintText: S.of(context).coupon_textfield_hint,
                      errorText: errorText),
                ).p4(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(S.of(context).action_cancel))
                        .pOnly(right: 2),
                    ElevatedButton(
                            onPressed: () async {
                              await runMutation(
                                      ApplyCouponArguments(code: _text.text)
                                          .toJson())
                                  .networkResult;
                            },
                            child: Text(S.of(context).action_apply))
                        .p4(),
                  ],
                ).objectCenterRight()
              ],
            );
          }),
    );
  }
}
