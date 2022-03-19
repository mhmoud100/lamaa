import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:ridy/generated/l10n.dart';
import '../graphql/generated/graphql_api.dart';
import 'bloc/main_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class LookingScreenView extends StatelessWidget {
  const LookingScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
      return Subscription(
        options: SubscriptionOptions(
            document: UPDATED_ORDER_SUBSCRIPTION_DOCUMENT,
            fetchPolicy: FetchPolicy.noCache),
        builder: (QueryResult result) {
          if (result.data != null) {
            final _order = GetCurrentOrder$Query$CurrentOrder$Order.fromJson(
                result.data!['orderUpdated']);
            mainBloc.add(OrderUpdated(order: _order));
          }
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LottieBuilder.asset(
                  "images/3532-car.json",
                  width: 400,
                  height: 400,
                ),
                Text(S.of(context).looking_heading).p16(),
                Mutation(
                    options: MutationOptions(
                        document: CANCEL_ORDER_MUTATION_DOCUMENT),
                    builder: (RunMutation runMutation, QueryResult? result) {
                      return ElevatedButton(
                          onPressed: () async {
                            final net = await runMutation({}).networkResult;
                            final _order =
                                CancelOrder$Mutation.fromJson(net!.data!)
                                    .cancelOrder;
                            mainBloc.add(OrderUpdated(order: _order));
                          },
                          child: Text(S.of(context).looking_cancel_request)
                              .px64());
                    })
              ],
            ),
          );
        },
      );
    });
  }
}
