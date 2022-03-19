import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/graphql/generated/graphql_api.dart';
import 'package:intl/intl.dart';

class EarningsView extends StatelessWidget {
  const EarningsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earnings"),
      ),
      body: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "Daily Earnings",
                      style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Income made on the services',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Query(
                            options: QueryOptions(
                                document: GET_STATS_QUERY_DOCUMENT),
                            builder: (QueryResult result,
                                {Future<QueryResult?> Function()? refetch,
                                FetchMore? fetchMore}) {
                              if (result.isLoading) {
                                return const CircularProgressIndicator
                                    .adaptive();
                              }
                              if (result.hasException) {
                                return Center(
                                    child: Text(result.exception?.graphqlErrors
                                            .first.message ??
                                        ""));
                              }
                              final stats =
                                  GetStats$Query.fromJson(result.data!)
                                      .getStats;
                              var index = 0;
                              final List<BarChartGroupData> barData = stats
                                  .dataset
                                  .map<BarChartGroupData>((data) =>
                                      BarChartGroupData(x: index++, barRods: [
                                        BarChartRodData(
                                          colors: [Colors.orange, Colors.green],
                                          y: data.earning,
                                        )
                                      ]))
                                  .toList();
                              return BarChart(
                                BarChartData(
                                  barTouchData: BarTouchData(
                                      touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.grey.shade800,
                                    getTooltipItem:
                                        (group, groupIndex, rod, rodIndex) =>
                                            BarTooltipItem(
                                                NumberFormat.simpleCurrency(
                                                        name: stats.currency)
                                                    .format(stats
                                                        .dataset[groupIndex]
                                                        .earning),
                                                TextStyle(color: Colors.white)),
                                  )),
                                  barGroups: barData,
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(
                                      leftTitles: SideTitles(showTitles: false),
                                      rightTitles:
                                          SideTitles(showTitles: false),
                                      topTitles: SideTitles(showTitles: false),
                                      bottomTitles: SideTitles(
                                        showTitles: true,
                                        getTextStyles: (context, value) =>
                                            TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                        getTitles: (value) =>
                                            stats.dataset[value.toInt()].name,
                                      )),
                                ),
                                swapAnimationDuration:
                                    const Duration(milliseconds: 250),
                              );
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Align(
              //     alignment: Alignment.topRight,
              //     child: IconButton(
              //       icon: Icon(
              //         isPlaying ? Icons.pause : Icons.play_arrow,
              //         color: const Color(0xff0f4a3c),
              //       ),
              //       onPressed: () {
              //         setState(() {
              //           isPlaying = !isPlaying;
              //           if (isPlaying) {
              //             refreshState();
              //           }
              //         });
              //       },
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
