import 'package:ridy/generated/l10n.dart';

import '../graphql/generated/graphql_api.dart';
import '../trip-history/trip_history_list_item.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../query_result_view.dart';

class TripHistoryView extends StatelessWidget {
  const TripHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).menu_trip_history),
      ),
      body: Query(
        options: QueryOptions(
            document: HISTORY_QUERY_DOCUMENT, fetchPolicy: FetchPolicy.noCache),
        builder: (QueryResult result,
            {Refetch? refetch, FetchMore? fetchMore}) {
          if (result.hasException || result.isLoading) {
            return QueryResultView(result);
          }
          final query = History$Query.fromJson(result.data!);
          final completed = query.completed.edges;
          final canceled = query.canceled.edges;
          if (completed.isEmpty && canceled.isEmpty) {
            return Center(
              child: Text(S.of(context).trip_history_empty_state),
            );
          }
          return DefaultTabController(
                  length: 2,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100,
                          ),
                          child: TabBar(
                              indicator: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.white,
                              tabs: <Tab>[
                                Tab(
                                    text: S
                                        .of(context)
                                        .trip_history_completed_tab),
                                Tab(
                                    text: S
                                        .of(context)
                                        .trip_history_canceled_tab),
                              ]),
                        ),
                        TabBarView(children: [
                          completed.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: completed.length,
                                  itemBuilder: (context, index) {
                                    return TripHistoryListItem(
                                        completed[index].node);
                                  })
                              : Center(
                                  child: Text(
                                      S.of(context).trip_history_empty_state),
                                ),
                          canceled.isNotEmpty
                              ? ListView.builder(
                                  itemCount: canceled.length,
                                  itemBuilder: (context, index) {
                                    return TripHistoryListItem(
                                        canceled[index].node);
                                  })
                              : Center(
                                  child: Text(
                                      S.of(context).trip_history_empty_state),
                                ),
                        ]).pOnly(top: 4).expand()
                      ],
                    ),
                  ).centered())
              .p8();
        },
      ),
    );
  }
}
