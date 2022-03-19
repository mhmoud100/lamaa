import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/chat/chat_cubit.dart';
import 'package:ridy/config.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/graphql/generated/graphql_api.dart';
import 'package:ridy/query_result_view.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      lazy: false,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).menu_chat),
          ),
          body: Query(
              options: QueryOptions(
                  document: GET_MESSAGES_QUERY_DOCUMENT,
                  fetchPolicy: FetchPolicy.noCache),
              builder: (QueryResult result,
                  {Future<QueryResult?> Function()? refetch,
                  FetchMore? fetchMore}) {
                if (result.isLoading || result.hasException) {
                  return QueryResultView(result);
                }
                var cubit = context.read<ChatCubit>();

                var order =
                    GetMessages$Query.fromJson(result.data!).currentOrder;
                var messages = order.conversations
                    .map((e) => e.toTextMessage(order.rider, order.driver!))
                    .toList();
                cubit.setMessages(messages);
                return Subscription(
                    options: SubscriptionOptions(
                        document: NEW_MESSAGE_RECEIVED_SUBSCRIPTION_DOCUMENT,
                        fetchPolicy: FetchPolicy.noCache),
                    builder: (QueryResult subscriptionResult) {
                      if (subscriptionResult.data != null) {
                        var message = NewMessageReceived$Subscription.fromJson(
                                subscriptionResult.data!)
                            .newMessageReceived
                            .toTextMessage(order.rider, order.driver!);
                        cubit.addMessage(message);
                      }
                      return Mutation(
                          options: MutationOptions(
                              document: SEND_MESSAGE_MUTATION_DOCUMENT,
                              fetchPolicy: FetchPolicy.noCache),
                          builder: (RunMutation runMutation,
                              QueryResult? mutationResult) {
                            return BlocBuilder<ChatCubit,
                                List<types.TextMessage>>(
                              builder: (context, state) {
                                return Chat(
                                    messages: state,
                                    onSendPressed: (text) async {
                                      var args = SendMessageArguments(
                                              content: text.text,
                                              requestId: order.id)
                                          .toJson();
                                      var result =
                                          await runMutation(args).networkResult;
                                      var message =
                                          SendMessage$Mutation.fromJson(
                                              result!.data!);
                                      cubit.addMessage(message
                                          .createOneOrderMessage
                                          .toTextMessage(
                                              order.rider, order.driver!));
                                    },
                                    user: order.rider.toUser());
                              },
                            );
                          });
                    });
              }),
        );
      }),
    );
  }
}

extension ChatDriverExtension on ChatDriverMixin {
  types.User toUser() => types.User(
      id: 'd$id',
      firstName: firstName,
      lastName: lastName,
      imageUrl: media == null ? null : serverUrl + media!.address);
}

extension ChatRiderExtension on ChatRiderMixin {
  types.User toUser() => types.User(
      id: 'r$id',
      firstName: firstName,
      lastName: lastName,
      imageUrl: media == null ? null : serverUrl + media!.address);
}

extension ChatMeessageExtension on ChatMessageMixin {
  types.TextMessage toTextMessage(
          ChatRiderMixin rider, ChatDriverMixin driver) =>
      types.TextMessage(
          id: id,
          text: content,
          author: sentByDriver ? driver.toUser() : rider.toUser());
}
