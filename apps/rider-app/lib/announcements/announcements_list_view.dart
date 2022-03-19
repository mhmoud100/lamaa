import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/query_result_view.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class AnnouncementsListView extends StatelessWidget {
  const AnnouncementsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).menu_announcements),
      ),
      body: Query(
          options: QueryOptions(document: GET_ANNOUNCEMENTS_QUERY_DOCUMENT),
          builder: (QueryResult result,
              {Future<QueryResult?> Function()? refetch,
              FetchMore? fetchMore}) {
            if (result.hasException || result.isLoading) {
              return QueryResultView(result);
            }
            final announcements = GetAnnouncements$Query.fromJson(result.data!)
                .announcements
                .edges;
            if (announcements.isEmpty) {
              return Center(
                  child: Text(S.of(context).announcements_empty_state_message));
            }
            return ListView.builder(
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('yyyy-MM-dd')
                                .format(announcements[index].node.startAt),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(announcements[index].node.title),
                        ],
                      ),
                      subtitle: Text(announcements[index].node.description)
                          .pOnly(top: 6),
                    ).pOnly(bottom: 10, top: 8),
                  );
                });
          }),
    );
  }
}
