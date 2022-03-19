// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/generated/l10n.dart';
import '../graphql/generated/graphql_api.dart';
import 'bloc/main_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../config.dart';

class OrderReviewCardView extends StatelessWidget {
  OrderReviewCardView({Key? key}) : super(key: key);
  int? tripRating;
  String? reviewText;

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
      return Mutation(
        options: MutationOptions(
            document: SUBMIT_FEEDBACK_MUTATION_DOCUMENT,
            update: (GraphQLDataProxy cache, QueryResult? result) {
              cache.writeQuery(
                  Operation(document: GET_CURRENT_ORDER_QUERY_DOCUMENT)
                      .asRequest(),
                  data: {
                    "currentOrderWithLocation": {
                      "order": result!.data!['submitReview'],
                      "driverLocation": {"lat": 10, "lng": 10}
                    },
                  });
              mainBloc.add(ResetState());
            }),
        builder: (RunMutation runMutation, QueryResult? result) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ((state as OrderReview).currentOrder.driver?.media?.address !=
                        null)
                    ? CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(serverUrl +
                                state.currentOrder.driver!.media!.address))
                        .pOnly(top: 16, bottom: 4)
                    : const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('images/default-user-image.png'),
                      ).pOnly(top: 16, bottom: 4),
                Text(
                  "${state.currentOrder.driver?.firstName ?? '-'} ${state.currentOrder.driver?.lastName ?? '-'}",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(S.of(context).review_text_heading,
                        style: Theme.of(context).textTheme.overline)
                    .pOnly(top: 24),
                RatingBar.builder(
                  allowHalfRating: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    tripRating = (rating * 20).toInt();
                  },
                ).p8(),
                TextField(
                  onChanged: (value) => (reviewText = value),
                  decoration: InputDecoration(
                      hintText: S.of(context).review_textfield_hint),
                ).p8(),
                ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 45)),
                        onPressed: () async {
                          await runMutation(SubmitFeedbackArguments(
                                      score: tripRating!,
                                      description: reviewText ?? "",
                                      orderId: state.currentOrder.id)
                                  .toJson())
                              .networkResult;
                        },
                        child: Text(S.of(context).review_action_submit_review))
                    .p4()
              ],
            ),
          );
        },
      );
    });
  }
}
