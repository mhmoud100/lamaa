import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ridy/chat/chat_view.dart';
import 'package:ridy/earnings/earnings_view.dart';
import 'package:ridy/map_providers/google_map_provider.dart';

import 'announcements/announcements_view.dart';
import 'config.dart';
import 'drawer_view.dart';
import 'generated/l10n.dart';
import 'main_bloc.dart';
import 'map_providers/open_street_map_provider.dart';
import 'order_status_card_view.dart';
import 'orders_carousel_view.dart';
import 'profile/profile_view.dart';
import 'query_result_view.dart';
import 'theme/theme.dart';
import 'trip-history/trip_history_view.dart';
import 'unregistered_driver_messages_view.dart';
import 'wallet/wallet_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'graphql/generated/graphql_api.dart';
import 'graphql_provider.dart';

// ignore: avoid_void_async
void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.openBox('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, Box box, widget) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<MainBloc>(lazy: false, create: (context) => MainBloc())
          ],
          child: MyGraphqlProvider(
            uri: "${serverUrl}graphql",
            subscriptionUri: "${wsUrl}graphql",
            jwt: box.get('jwt').toString(),
            child: MaterialApp(
                title: 'Ridy',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                routes: {
                  'register': (context) => const ProfileView(),
                  'trip-history': (context) => const TripHistoryView(),
                  'announcements': (context) => const AnnouncementsView(),
                  'earnings': (context) => const EarningsView(),
                  'chat': (context) => const ChatView(),
                  'wallet': (context) => const WalletView(),
                },
                theme: CustomTheme.theme1,
                home: MyHomePage()),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return Scaffold(
        key: scaffoldKey,
        drawer: const Drawer(
          child: DrawerView(),
        ),
        body: ValueListenableBuilder(
            valueListenable: Hive.box('user').listenable(),
            builder: (context, Box box, widget) {
              if (box.get('jwt') == null) {
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, 'register');
                });
                return Center(child: Text(S.of(context).status_need_login));
              } else {
                return Query(
                    options: QueryOptions(
                        document: ME_QUERY_DOCUMENT,
                        fetchPolicy: FetchPolicy.noCache),
                    builder: (QueryResult result,
                        {Future<QueryResult?> Function()? refetch,
                        FetchMore? fetchMore}) {
                      if (result.isLoading || result.hasException) {
                        return QueryResultView(result);
                      }
                      final mquery = Me$Query.fromJson(result.data!);
                      mainBloc.add(DriverUpdated(mquery.driver!));
                      return BlocConsumer<MainBloc, MainState>(
                          listenWhen: (MainState previous, MainState current) {
                        if (previous is StatusUnregistered &&
                            current is StatusUnregistered &&
                            previous.driver?.status == current.driver?.status) {
                          return false;
                        }
                        if ((previous is StatusOnline ||
                                previous is StatusOffline) &&
                            current is StatusOnline) {
                          return false;
                        }
                        return true;
                      }, listener: (context, state) {
                        if (state is StatusUnregistered &&
                            state.driver!.status ==
                                DriverStatus.waitingDocuments) {
                          Navigator.pushNamed(context, 'register');
                        }
                        if (state is StatusOnline) {
                          refetch!();
                        }
                      }, buildWhen: (previous, next) {
                        if (previous is StatusOnline && next is StatusOnline) {
                          if (previous.driver?.wallets
                                  .sum((p0) => p0.balance) ==
                              next.driver?.wallets.sum((p0) => p0.balance)) {
                            return false;
                          }
                        }
                        return true;
                      }, builder: (context, state) {
                        if (state.driver == null) return Container();
                        if (state is StatusUnregistered) {
                          return UnregisteredDriverMessagesView(
                              driver: state.driver!);
                        }
                        return Stack(children: [
                          if (mapProvider == MapProvider.googleMap)
                            GoogleMapProvider(),
                          if (mapProvider == MapProvider.openStreetMap ||
                              mapProvider == MapProvider.mapBox)
                            OpenStreetMapProvider(),
                          SafeArea(
                            minimum: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                _getMenuButton(),
                                const Spacer(),
                                _getWalletButton(context, state),
                                if (state is! StatusInService) const Spacer(),
                                _getOnlineOfflineButton(context, state)
                              ],
                            ),
                          ),
                          SafeArea(
                            minimum: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                const Spacer(),
                                if (state is StatusInService &&
                                    state.driver!.orders.nodes.isNotEmpty)
                                  OrderStatusCardView(
                                          order:
                                              state.driver!.orders.nodes.first)
                                      .centered(),
                                if (state is StatusOnline) OrdersCarouselView(),
                              ],
                            ),
                          ),
                        ]);
                      });
                    });
              }
            }));
  }

  Widget _getOnlineOfflineButton(BuildContext context, MainState state) {
    final mainBloc = context.read<MainBloc>();

    return Mutation(
        options:
            MutationOptions(document: UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: (state is StatusOffline)
                  ? FloatingActionButton.extended(
                      key: const Key('offline'),
                      heroTag: 'fabOffline',
                      onPressed: (result?.isLoading ?? false)
                          ? null
                          : () async {
                              final fcmId = await getFcmId(context);
                              final res = await runMutation(
                                      UpdateDriverStatusArguments(
                                              status: DriverStatus.online,
                                              fcmId: fcmId)
                                          .toJson())
                                  .networkResult;
                              final _driver =
                                  UpdateDriverStatus$Mutation.fromJson(
                                      res!.data!);
                              mainBloc
                                  .add(DriverUpdated(_driver.updateOneDriver));
                            },
                      label: Text(S.of(context).statusOffline),
                      icon: const Icon(Icons.offline_bolt),
                    )
                  : ((state is StatusOnline)
                      ? FloatingActionButton.extended(
                          key: const Key('online'),
                          heroTag: 'fabOnline',
                          onPressed: (result?.isLoading ?? false)
                              ? null
                              : () async {
                                  final res = await runMutation(
                                          UpdateDriverStatusArguments(
                                                  status: DriverStatus.offline)
                                              .toJson())
                                      .networkResult;
                                  final _driver =
                                      UpdateDriverStatus$Mutation.fromJson(
                                          res!.data!);
                                  mainBloc.add(
                                      DriverUpdated(_driver.updateOneDriver));
                                },
                          label: Text(S.of(context).statusOnline),
                          backgroundColor: Colors.green,
                          icon: const Icon(Icons.online_prediction),
                        )
                      : const SizedBox(
                          height: 10,
                        )));
        });
  }

  Widget _getMenuButton() {
    return FloatingActionButton(
        heroTag: 'fabMenu',
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.menu,
          color: Colors.white,
        ));
  }

  Widget _getWalletButton(BuildContext context, MainState state) {
    return FloatingActionButton.extended(
        heroTag: 'fabIncome',
        onPressed: () => Navigator.pushNamed(context, 'earnings'),
        backgroundColor: Colors.black,
        icon: const Icon(Icons.account_balance_wallet),
        label: Text(
          (state.driver?.wallets.length ?? 0) > 0
              ? NumberFormat.simpleCurrency(
                      name: state.driver!.wallets.first.currency)
                  .format(state.driver!.wallets.first.balance)
              : "-",
        ));
  }

  Future<String?> getFcmId(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title:
                    Text(S.of(context).message_notification_permission_title),
                content: Text(S
                    .of(context)
                    .message_notification_permission_denined_message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(S.of(context).action_ok),
                  )
                ],
              ));
    } else {
      return messaging.getToken(
        vapidKey:
            "",
      );
    }
  }
}
