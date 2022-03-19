// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import '../coupons/coupon_item_view.dart';
// import '../graphql/generated/graphql_api.dart';
// import '../query_result_view.dart';

// class CouponsListView extends StatelessWidget {
//   const CouponsListView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Coupons"),
//       ),
//       body: Query(
//           options: QueryOptions(
//               document: GET_COUPONS_QUERY_DOCUMENT,
//               fetchPolicy: FetchPolicy.noCache),
//           builder: (QueryResult result,
//               {Future<QueryResult?> Function()? refetch,
//               FetchMore? fetchMore}) {
//             if (result.hasException || result.isLoading) {
//               return QueryResultView(result);
//             }
//             final records = GetCoupons$Query.fromJson(result.data!).coupons;
//             if (records.isEmpty) {
//               return const Center(
//                 child: Text("Nothing to see here."),
//               );
//             }
//             return ListView.builder(
//                 itemCount: records.length,
//                 itemBuilder: (context, int index) {
//                   return CouponItemView(records[index]);
//                 });
//           }),
//     );
//   }
// }
