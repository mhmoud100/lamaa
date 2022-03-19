import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ridy/chat/chat_view.dart';
import 'package:ridy/main/bloc/locations_cubit.dart';
import 'package:ridy/main/map_providers/google_map_provider.dart';
import 'address/address_list_view.dart';
import 'announcements/announcements_list_view.dart';
import 'graphql/generated/graphql_api.dart';
import 'history/trip_history_list_view.dart';
import 'main/bloc/main_bloc.dart';
import 'main/drawer_logged_in.dart';
import 'main/drawer_logged_out.dart';
import 'main/driver_info_card_view.dart';
import 'main/graphql_provider.dart';
import 'main/looking.dart';
import 'main/order_review_card_view.dart';
import 'main/point_selection_view.dart';
import 'main/service_selection_card_view.dart';
import 'profile/profile_view.dart';
import 'theme/theme.dart';
import 'wallet/wallet_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'config.dart';
import 'main/map_providers/open_street_map_provider.dart';
import 'main/order_invoice_card_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, Box box, widget) {
        return MyGraphqlProvider(
          uri: "${serverUrl}graphql",
          subscriptionUri: "${wsUrl}graphql",
          jwt: box.get('jwt').toString(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (BuildContext context) => S.of(context).app_name,
            title: 'Ridy',
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routes: {
              'addresses': (context) => const AddressListView(),
              'announcements': (context) => const AnnouncementsListView(),
              'history': (context) => const TripHistoryListView(),
              'wallet': (context) => const WalletView(),
              'chat': (context) => const ChatView(),
              //'coupons': (context) => const CouponsListView(),
              'profile': (context) => ProfileView()
            },
            theme: CustomTheme.theme1,
            home: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => MainBloc()),
                BlocProvider(create: (context) => LocationsCubit())
              ],
              child: const MyHomePage(),
            ),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<MyHomePage> {
  late GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ValueListenableBuilder(
            valueListenable: Hive.box('user').listenable(),
            builder: (context, Box box, widget) {
              if (box.get('jwt') == null) {
                return const DrawerLoggedOut();
              } else {
                return const DrawerLoggedIn();
              }
            }),
      ),
      body: Query(
          options: QueryOptions(
              document: GET_CURRENT_ORDER_QUERY_DOCUMENT,
              fetchPolicy: FetchPolicy.noCache),
          builder: (QueryResult result,
              {Refetch? refetch, FetchMore? fetchMore}) {
            if (result.isLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (result.data != null) {
              final _order = GetCurrentOrder$Query.fromJson(result.data!)
                  .currentOrderWithLocation;
              mainBloc.add(OrderUpdated(
                  order: _order.order, driverLocation: _order.driverLocation));
            }
            return BlocBuilder<MainBloc, MainBlocState>(
                builder: (context, state) {
              if (state is OrderLooking) {
                return const LookingScreenView();
              }
              return Stack(children: [
                if (mapProvider == MapProvider.openStreetMap ||
                    mapProvider == MapProvider.mapBox)
                  const OpenStreetMapProvider(),
                if (mapProvider == MapProvider.googleMap)
                  const GoogleMapProvider(),
                if (state is SelectingPoints && state.points.isEmpty)
                  FloatingActionButton(
                    heroTag: 'menuFab',
                    onPressed: () => scaffoldKey.currentState?.openDrawer(),
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ).safeArea(minimum: const EdgeInsets.all(16)).objectTopLeft(),
                if (state is SelectingPoints && state.points.isNotEmpty)
                  FloatingActionButton(
                    heroTag: 'removeFab',
                    onPressed: () => mainBloc.add(DropLastPoint()),
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ).safeArea(minimum: const EdgeInsets.all(16)),
                Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (state is OrderInProgress ||
                            state is OrderInvoice ||
                            state is OrderReview)
                          Subscription(
                              options: SubscriptionOptions(
                                  document: UPDATED_ORDER_SUBSCRIPTION_DOCUMENT,
                                  fetchPolicy: FetchPolicy.noCache),
                              builder: (QueryResult result) {
                                if (result.data != null) {
                                  final _order =
                                      GetCurrentOrder$Query$CurrentOrder$Order
                                          .fromJson(
                                              result.data!['orderUpdated']);
                                  if ((state is OrderInProgress &&
                                          state.currentOrder.status !=
                                              _order.status) ||
                                      (state is OrderInvoice &&
                                          state.currentOrder.status !=
                                              _order.status) ||
                                      (state is OrderReview &&
                                          state.currentOrder.status !=
                                              _order.status)) {
                                    WidgetsBinding.instance
                                        ?.addPostFrameCallback((_) {
                                      mainBloc.add(OrderUpdated(order: _order));
                                    });
                                  }
                                }
                                if (state is OrderInProgress) {
                                  return DriverInfoCardView(
                                      order: state.currentOrder);
                                }
                                if (state is OrderInvoice) {
                                  return const OrderInvoiceCardView();
                                }
                                if (state is OrderReview) {
                                  return OrderReviewCardView();
                                }
                                return const Text("Unacceptable state");
                              }),
                        if (state is OrderPreview)
                          const ServiceSelectionCardView(),
                        if (state is SelectingPoints) PointSelectionView()
                      ]),
                ).centered().safeArea(minimum: const EdgeInsets.all(8))
              ]);
            });
          }),
    );
  }
}
