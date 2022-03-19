import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/generated/l10n.dart';
import '../address/address_details_view.dart';
import '../graphql/generated/graphql_api.dart';
import '../query_result_view.dart';
import 'package:velocity_x/velocity_x.dart';

class AddressListView extends StatefulWidget {
  const AddressListView({Key? key}) : super(key: key);

  @override
  _AddressListViewState createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  List<GetAddresses$Query$RiderAddress> allAddresses = [];
  Refetch? refetch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).menu_saved_locations),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const AddressDetailsView();
              },
            );
            refetch?.call();
          },
          child: const Icon(Icons.add),
        ),
        body: Query(
          options: QueryOptions(document: GET_ADDRESSES_QUERY_DOCUMENT),
          builder: (QueryResult result,
              {Future<QueryResult?> Function()? refetch,
              FetchMore? fetchMore}) {
            if (result.isLoading || result.hasException) {
              return QueryResultView(result);
            }
            this.refetch = refetch;
            allAddresses =
                GetAddresses$Query.fromJson(result.data!).riderAddresses;
            if (allAddresses.isEmpty) {
              return Center(
                  child: Text(S.of(context).addresses_empty_state_message));
            }
            return Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Mutation(
                      options: MutationOptions(
                          document: DELETE_ADDRESS_MUTATION_DOCUMENT),
                      builder: (
                        RunMutation runMutation,
                        QueryResult? result,
                      ) {
                        return Card(
                            child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              allAddresses[index].title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Text(allAddresses[index].details),
                          ),
                          trailing: PopupMenuButton(
                            onSelected: (value) async {
                              if (value == 1) {
                                await runMutation(
                                        {"id": allAddresses[index].id})
                                    .networkResult;
                                refetch?.call();
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                // PopupMenuItem(
                                //   value: 0,
                                //   child: Row(children: const [
                                //     Icon(Icons.edit),
                                //     SizedBox(width: 10),
                                //     Text("Edit")
                                //   ]),
                                // ),
                                PopupMenuItem(
                                  value: 1,
                                  child: Row(children: [
                                    const Icon(Icons.delete),
                                    const SizedBox(width: 10),
                                    Text(S.of(context).action_delete)
                                  ]),
                                )
                              ];
                            },
                          ),
                        ));
                      });
                },
                itemCount: allAddresses.length,
              ),
            ).centered();
          },
        ));
  }
}
