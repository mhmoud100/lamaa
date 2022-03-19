import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/generated/l10n.dart';
import '../graphql/generated/graphql_api.dart';
import 'bloc/main_bloc.dart';
import '../main/select_service_view.dart';
import 'package:velocity_x/velocity_x.dart';

class ServiceSelectionCardView extends StatelessWidget {
  const ServiceSelectionCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
      return Mutation(
        options: MutationOptions(document: CREATE_ORDER_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          return Column(
            children: [
              FloatingActionButton.extended(
                      heroTag: 'cancelFab',
                      onPressed: () => mainBloc.add(ResetState()),
                      label: Text(S.of(context).action_cancel),
                      icon: const Icon(Icons.close))
                  .pOnly(bottom: 8)
                  .objectCenterRight(),
              SelectServiceView(
                data: (state as OrderPreview).fareResult,
                onServiceSelect: (String serviceId, int intervalMinutes) async {
                  final args = CreateOrderArguments(
                          input: CreateOrderInput(
                              serviceId: int.parse(serviceId),
                              intervalMinutes: 0,
                              points: state.points
                                  .map((e) => PointInput(
                                      lat: e.point.latitude,
                                      lng: e.point.longitude))
                                  .toList(),
                              addresses:
                                  state.points.map((e) => e.address).toList()))
                      .toJson();
                  final result = await runMutation(args).networkResult;
                  final _order =
                      CreateOrder$Mutation.fromJson(result!.data!).createOrder;
                  mainBloc.add(OrderUpdated(order: _order));
                },
              ),
            ],
          );
        },
      );
    });
  }
}
