// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessages$Query$Order$Rider _$GetMessages$Query$Order$RiderFromJson(
        Map<String, dynamic> json) =>
    GetMessages$Query$Order$Rider()
      ..id = json['id'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..media = json['media'] == null
          ? null
          : ChatRiderMixin$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMessages$Query$Order$RiderToJson(
        GetMessages$Query$Order$Rider instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'media': instance.media?.toJson(),
    };

GetMessages$Query$Order$Driver _$GetMessages$Query$Order$DriverFromJson(
        Map<String, dynamic> json) =>
    GetMessages$Query$Order$Driver()
      ..id = json['id'] as String
      ..firstName = json['firstName'] as String
      ..lastName = json['lastName'] as String
      ..media = json['media'] == null
          ? null
          : ChatDriverMixin$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMessages$Query$Order$DriverToJson(
        GetMessages$Query$Order$Driver instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'media': instance.media?.toJson(),
    };

GetMessages$Query$Order$OrderMessage
    _$GetMessages$Query$Order$OrderMessageFromJson(Map<String, dynamic> json) =>
        GetMessages$Query$Order$OrderMessage()
          ..id = json['id'] as String
          ..content = json['content'] as String
          ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic> _$GetMessages$Query$Order$OrderMessageToJson(
        GetMessages$Query$Order$OrderMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sentByDriver': instance.sentByDriver,
    };

GetMessages$Query$Order _$GetMessages$Query$OrderFromJson(
        Map<String, dynamic> json) =>
    GetMessages$Query$Order()
      ..id = json['id'] as String
      ..rider = GetMessages$Query$Order$Rider.fromJson(
          json['rider'] as Map<String, dynamic>)
      ..driver = json['driver'] == null
          ? null
          : GetMessages$Query$Order$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..conversations = (json['conversations'] as List<dynamic>)
          .map((e) => GetMessages$Query$Order$OrderMessage.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetMessages$Query$OrderToJson(
        GetMessages$Query$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rider': instance.rider.toJson(),
      'driver': instance.driver?.toJson(),
      'conversations': instance.conversations.map((e) => e.toJson()).toList(),
    };

GetMessages$Query _$GetMessages$QueryFromJson(Map<String, dynamic> json) =>
    GetMessages$Query()
      ..currentOrder = GetMessages$Query$Order.fromJson(
          json['currentOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMessages$QueryToJson(GetMessages$Query instance) =>
    <String, dynamic>{
      'currentOrder': instance.currentOrder.toJson(),
    };

ChatRiderMixin$Media _$ChatRiderMixin$MediaFromJson(
        Map<String, dynamic> json) =>
    ChatRiderMixin$Media()..address = json['address'] as String;

Map<String, dynamic> _$ChatRiderMixin$MediaToJson(
        ChatRiderMixin$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

ChatDriverMixin$Media _$ChatDriverMixin$MediaFromJson(
        Map<String, dynamic> json) =>
    ChatDriverMixin$Media()..address = json['address'] as String;

Map<String, dynamic> _$ChatDriverMixin$MediaToJson(
        ChatDriverMixin$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

SendMessage$Mutation$OrderMessage _$SendMessage$Mutation$OrderMessageFromJson(
        Map<String, dynamic> json) =>
    SendMessage$Mutation$OrderMessage()
      ..id = json['id'] as String
      ..content = json['content'] as String
      ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic> _$SendMessage$Mutation$OrderMessageToJson(
        SendMessage$Mutation$OrderMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sentByDriver': instance.sentByDriver,
    };

SendMessage$Mutation _$SendMessage$MutationFromJson(
        Map<String, dynamic> json) =>
    SendMessage$Mutation()
      ..createOneOrderMessage = SendMessage$Mutation$OrderMessage.fromJson(
          json['createOneOrderMessage'] as Map<String, dynamic>);

Map<String, dynamic> _$SendMessage$MutationToJson(
        SendMessage$Mutation instance) =>
    <String, dynamic>{
      'createOneOrderMessage': instance.createOneOrderMessage.toJson(),
    };

NewMessageReceived$Subscription$OrderMessage
    _$NewMessageReceived$Subscription$OrderMessageFromJson(
            Map<String, dynamic> json) =>
        NewMessageReceived$Subscription$OrderMessage()
          ..id = json['id'] as String
          ..content = json['content'] as String
          ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic> _$NewMessageReceived$Subscription$OrderMessageToJson(
        NewMessageReceived$Subscription$OrderMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sentByDriver': instance.sentByDriver,
    };

NewMessageReceived$Subscription _$NewMessageReceived$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    NewMessageReceived$Subscription()
      ..newMessageReceived =
          NewMessageReceived$Subscription$OrderMessage.fromJson(
              json['newMessageReceived'] as Map<String, dynamic>);

Map<String, dynamic> _$NewMessageReceived$SubscriptionToJson(
        NewMessageReceived$Subscription instance) =>
    <String, dynamic>{
      'newMessageReceived': instance.newMessageReceived.toJson(),
    };

GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
    _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$AnnouncementFromJson(
            Map<String, dynamic> json) =>
        GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement()
          ..id = json['id'] as String
          ..title = json['title'] as String
          ..startAt = fromGraphQLTimestampToDartDateTime(json['startAt'] as int)
          ..description = json['description'] as String;

Map<String, dynamic>
    _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$AnnouncementToJson(
            GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'title': instance.title,
          'startAt': fromDartDateTimeToGraphQLTimestamp(instance.startAt),
          'description': instance.description,
        };

GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge
    _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdgeFromJson(
            Map<String, dynamic> json) =>
        GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge()
          ..node =
              GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String, dynamic>
    _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdgeToJson(
            GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge
                instance) =>
        <String, dynamic>{
          'node': instance.node.toJson(),
        };

GetAnnouncements$Query$AnnouncementConnection
    _$GetAnnouncements$Query$AnnouncementConnectionFromJson(
            Map<String, dynamic> json) =>
        GetAnnouncements$Query$AnnouncementConnection()
          ..edges = (json['edges'] as List<dynamic>)
              .map((e) =>
                  GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetAnnouncements$Query$AnnouncementConnectionToJson(
        GetAnnouncements$Query$AnnouncementConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };

GetAnnouncements$Query _$GetAnnouncements$QueryFromJson(
        Map<String, dynamic> json) =>
    GetAnnouncements$Query()
      ..announcements = GetAnnouncements$Query$AnnouncementConnection.fromJson(
          json['announcements'] as Map<String, dynamic>);

Map<String, dynamic> _$GetAnnouncements$QueryToJson(
        GetAnnouncements$Query instance) =>
    <String, dynamic>{
      'announcements': instance.announcements.toJson(),
    };

GetRider$Query$Rider$Media _$GetRider$Query$Rider$MediaFromJson(
        Map<String, dynamic> json) =>
    GetRider$Query$Rider$Media()..address = json['address'] as String;

Map<String, dynamic> _$GetRider$Query$Rider$MediaToJson(
        GetRider$Query$Rider$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

GetRider$Query$Rider _$GetRider$Query$RiderFromJson(
        Map<String, dynamic> json) =>
    GetRider$Query$Rider()
      ..id = json['id'] as String
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..gender = $enumDecodeNullable(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.artemisUnknown)
      ..email = json['email'] as String?
      ..media = json['media'] == null
          ? null
          : GetRider$Query$Rider$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$GetRider$Query$RiderToJson(
        GetRider$Query$Rider instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobileNumber': instance.mobileNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': _$GenderEnumMap[instance.gender],
      'email': instance.email,
      'media': instance.media?.toJson(),
    };

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
  Gender.unknown: 'Unknown',
  Gender.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetRider$Query _$GetRider$QueryFromJson(Map<String, dynamic> json) =>
    GetRider$Query()
      ..rider = json['rider'] == null
          ? null
          : GetRider$Query$Rider.fromJson(
              json['rider'] as Map<String, dynamic>);

Map<String, dynamic> _$GetRider$QueryToJson(GetRider$Query instance) =>
    <String, dynamic>{
      'rider': instance.rider?.toJson(),
    };

UpdateProfile$Mutation$Rider _$UpdateProfile$Mutation$RiderFromJson(
        Map<String, dynamic> json) =>
    UpdateProfile$Mutation$Rider()..id = json['id'] as String;

Map<String, dynamic> _$UpdateProfile$Mutation$RiderToJson(
        UpdateProfile$Mutation$Rider instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateProfile$Mutation _$UpdateProfile$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateProfile$Mutation()
      ..updateOneRider = UpdateProfile$Mutation$Rider.fromJson(
          json['updateOneRider'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateProfile$MutationToJson(
        UpdateProfile$Mutation instance) =>
    <String, dynamic>{
      'updateOneRider': instance.updateOneRider.toJson(),
    };

GetAddresses$Query$RiderAddress$Point
    _$GetAddresses$Query$RiderAddress$PointFromJson(
            Map<String, dynamic> json) =>
        GetAddresses$Query$RiderAddress$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetAddresses$Query$RiderAddress$PointToJson(
        GetAddresses$Query$RiderAddress$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetAddresses$Query$RiderAddress _$GetAddresses$Query$RiderAddressFromJson(
        Map<String, dynamic> json) =>
    GetAddresses$Query$RiderAddress()
      ..id = json['id'] as String
      ..title = json['title'] as String
      ..type = $enumDecode(_$RiderAddressTypeEnumMap, json['type'],
          unknownValue: RiderAddressType.artemisUnknown)
      ..details = json['details'] as String
      ..location = GetAddresses$Query$RiderAddress$Point.fromJson(
          json['location'] as Map<String, dynamic>);

Map<String, dynamic> _$GetAddresses$Query$RiderAddressToJson(
        GetAddresses$Query$RiderAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$RiderAddressTypeEnumMap[instance.type],
      'details': instance.details,
      'location': instance.location.toJson(),
    };

const _$RiderAddressTypeEnumMap = {
  RiderAddressType.home: 'Home',
  RiderAddressType.work: 'Work',
  RiderAddressType.partner: 'Partner',
  RiderAddressType.other: 'Other',
  RiderAddressType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetAddresses$Query _$GetAddresses$QueryFromJson(Map<String, dynamic> json) =>
    GetAddresses$Query()
      ..riderAddresses = (json['riderAddresses'] as List<dynamic>)
          .map((e) => GetAddresses$Query$RiderAddress.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetAddresses$QueryToJson(GetAddresses$Query instance) =>
    <String, dynamic>{
      'riderAddresses': instance.riderAddresses.map((e) => e.toJson()).toList(),
    };

CreateAddress$Mutation$RiderAddress
    _$CreateAddress$Mutation$RiderAddressFromJson(Map<String, dynamic> json) =>
        CreateAddress$Mutation$RiderAddress()..id = json['id'] as String;

Map<String, dynamic> _$CreateAddress$Mutation$RiderAddressToJson(
        CreateAddress$Mutation$RiderAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateAddress$Mutation _$CreateAddress$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateAddress$Mutation()
      ..createOneRiderAddress = CreateAddress$Mutation$RiderAddress.fromJson(
          json['createOneRiderAddress'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateAddress$MutationToJson(
        CreateAddress$Mutation instance) =>
    <String, dynamic>{
      'createOneRiderAddress': instance.createOneRiderAddress.toJson(),
    };

DeleteAddress$Mutation$RiderAddressDeleteResponse
    _$DeleteAddress$Mutation$RiderAddressDeleteResponseFromJson(
            Map<String, dynamic> json) =>
        DeleteAddress$Mutation$RiderAddressDeleteResponse()
          ..id = json['id'] as String?;

Map<String, dynamic> _$DeleteAddress$Mutation$RiderAddressDeleteResponseToJson(
        DeleteAddress$Mutation$RiderAddressDeleteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

DeleteAddress$Mutation _$DeleteAddress$MutationFromJson(
        Map<String, dynamic> json) =>
    DeleteAddress$Mutation()
      ..deleteOneRiderAddress =
          DeleteAddress$Mutation$RiderAddressDeleteResponse.fromJson(
              json['deleteOneRiderAddress'] as Map<String, dynamic>);

Map<String, dynamic> _$DeleteAddress$MutationToJson(
        DeleteAddress$Mutation instance) =>
    <String, dynamic>{
      'deleteOneRiderAddress': instance.deleteOneRiderAddress.toJson(),
    };

GetHistory$Query$Completed _$GetHistory$Query$CompletedFromJson(
        Map<String, dynamic> json) =>
    GetHistory$Query$Completed()
      ..edges = (json['edges'] as List<dynamic>)
          .map((e) => HistoryOrderItemMixin$OrderEdge.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..pageInfo = HistoryOrderItemMixin$PageInfo.fromJson(
          json['pageInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$GetHistory$Query$CompletedToJson(
        GetHistory$Query$Completed instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
      'pageInfo': instance.pageInfo.toJson(),
    };

GetHistory$Query$Canceled _$GetHistory$Query$CanceledFromJson(
        Map<String, dynamic> json) =>
    GetHistory$Query$Canceled()
      ..edges = (json['edges'] as List<dynamic>)
          .map((e) => HistoryOrderItemMixin$OrderEdge.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..pageInfo = HistoryOrderItemMixin$PageInfo.fromJson(
          json['pageInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$GetHistory$Query$CanceledToJson(
        GetHistory$Query$Canceled instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
      'pageInfo': instance.pageInfo.toJson(),
    };

GetHistory$Query _$GetHistory$QueryFromJson(Map<String, dynamic> json) =>
    GetHistory$Query()
      ..completed = GetHistory$Query$Completed.fromJson(
          json['completed'] as Map<String, dynamic>)
      ..canceled = GetHistory$Query$Canceled.fromJson(
          json['canceled'] as Map<String, dynamic>);

Map<String, dynamic> _$GetHistory$QueryToJson(GetHistory$Query instance) =>
    <String, dynamic>{
      'completed': instance.completed.toJson(),
      'canceled': instance.canceled.toJson(),
    };

HistoryOrderItemMixin$OrderEdge$Order$PaymentGateway
    _$HistoryOrderItemMixin$OrderEdge$Order$PaymentGatewayFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order$PaymentGateway()
          ..title = json['title'] as String;

Map<String, dynamic>
    _$HistoryOrderItemMixin$OrderEdge$Order$PaymentGatewayToJson(
            HistoryOrderItemMixin$OrderEdge$Order$PaymentGateway instance) =>
        <String, dynamic>{
          'title': instance.title,
        };

HistoryOrderItemMixin$OrderEdge$Order$Driver
    _$HistoryOrderItemMixin$OrderEdge$Order$DriverFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order$Driver()
          ..firstName = json['firstName'] as String
          ..lastName = json['lastName'] as String;

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdge$Order$DriverToJson(
        HistoryOrderItemMixin$OrderEdge$Order$Driver instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

HistoryOrderItemMixin$OrderEdge$Order$Service$Media
    _$HistoryOrderItemMixin$OrderEdge$Order$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic>
    _$HistoryOrderItemMixin$OrderEdge$Order$Service$MediaToJson(
            HistoryOrderItemMixin$OrderEdge$Order$Service$Media instance) =>
        <String, dynamic>{
          'address': instance.address,
        };

HistoryOrderItemMixin$OrderEdge$Order$Service
    _$HistoryOrderItemMixin$OrderEdge$Order$ServiceFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order$Service()
          ..media =
              HistoryOrderItemMixin$OrderEdge$Order$Service$Media.fromJson(
                  json['media'] as Map<String, dynamic>)
          ..name = json['name'] as String;

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdge$Order$ServiceToJson(
        HistoryOrderItemMixin$OrderEdge$Order$Service instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'name': instance.name,
    };

HistoryOrderItemMixin$OrderEdge$Order
    _$HistoryOrderItemMixin$OrderEdge$OrderFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order()
          ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
              unknownValue: OrderStatus.artemisUnknown)
          ..createdOn =
              fromGraphQLTimestampToDartDateTime(json['createdOn'] as int)
          ..addresses = (json['addresses'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          ..currency = json['currency'] as String
          ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
          ..paymentGateway = json['paymentGateway'] == null
              ? null
              : HistoryOrderItemMixin$OrderEdge$Order$PaymentGateway.fromJson(
                  json['paymentGateway'] as Map<String, dynamic>)
          ..driver = json['driver'] == null
              ? null
              : HistoryOrderItemMixin$OrderEdge$Order$Driver.fromJson(
                  json['driver'] as Map<String, dynamic>)
          ..service = HistoryOrderItemMixin$OrderEdge$Order$Service.fromJson(
              json['service'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdge$OrderToJson(
        HistoryOrderItemMixin$OrderEdge$Order instance) =>
    <String, dynamic>{
      'status': _$OrderStatusEnumMap[instance.status],
      'createdOn': fromDartDateTimeToGraphQLTimestamp(instance.createdOn),
      'addresses': instance.addresses,
      'currency': instance.currency,
      'costAfterCoupon': instance.costAfterCoupon,
      'paymentGateway': instance.paymentGateway?.toJson(),
      'driver': instance.driver?.toJson(),
      'service': instance.service.toJson(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.requested: 'Requested',
  OrderStatus.notFound: 'NotFound',
  OrderStatus.noCloseFound: 'NoCloseFound',
  OrderStatus.found: 'Found',
  OrderStatus.driverAccepted: 'DriverAccepted',
  OrderStatus.arrived: 'Arrived',
  OrderStatus.waitingForPrePay: 'WaitingForPrePay',
  OrderStatus.driverCanceled: 'DriverCanceled',
  OrderStatus.riderCanceled: 'RiderCanceled',
  OrderStatus.started: 'Started',
  OrderStatus.waitingForPostPay: 'WaitingForPostPay',
  OrderStatus.waitingForReview: 'WaitingForReview',
  OrderStatus.finished: 'Finished',
  OrderStatus.booked: 'Booked',
  OrderStatus.expired: 'Expired',
  OrderStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

HistoryOrderItemMixin$OrderEdge _$HistoryOrderItemMixin$OrderEdgeFromJson(
        Map<String, dynamic> json) =>
    HistoryOrderItemMixin$OrderEdge()
      ..node = HistoryOrderItemMixin$OrderEdge$Order.fromJson(
          json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdgeToJson(
        HistoryOrderItemMixin$OrderEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
    };

HistoryOrderItemMixin$PageInfo _$HistoryOrderItemMixin$PageInfoFromJson(
        Map<String, dynamic> json) =>
    HistoryOrderItemMixin$PageInfo()
      ..hasNextPage = json['hasNextPage'] as bool?
      ..endCursor = fromGraphQLConnectionCursorNullableToDartStringNullable(
          json['endCursor'] as String?)
      ..startCursor = fromGraphQLConnectionCursorNullableToDartStringNullable(
          json['startCursor'] as String?)
      ..hasPreviousPage = json['hasPreviousPage'] as bool?;

Map<String, dynamic> _$HistoryOrderItemMixin$PageInfoToJson(
        HistoryOrderItemMixin$PageInfo instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'endCursor': fromDartStringNullableToGraphQLConnectionCursorNullable(
          instance.endCursor),
      'startCursor': fromDartStringNullableToGraphQLConnectionCursorNullable(
          instance.startCursor),
      'hasPreviousPage': instance.hasPreviousPage,
    };

Wallet$Query$RiderWallet _$Wallet$Query$RiderWalletFromJson(
        Map<String, dynamic> json) =>
    Wallet$Query$RiderWallet()
      ..id = json['id'] as String
      ..balance = (json['balance'] as num).toDouble()
      ..currency = json['currency'] as String;

Map<String, dynamic> _$Wallet$Query$RiderWalletToJson(
        Wallet$Query$RiderWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'currency': instance.currency,
    };

Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
    _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacionFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion()
          ..createdAt =
              fromGraphQLTimestampToDartDateTime(json['createdAt'] as int)
          ..amount = (json['amount'] as num).toDouble()
          ..currency = json['currency'] as String
          ..refrenceNumber = json['refrenceNumber'] as String?
          ..deductType = $enumDecodeNullable(
              _$RiderDeductTransactionTypeEnumMap, json['deductType'],
              unknownValue: RiderDeductTransactionType.artemisUnknown)
          ..action = $enumDecode(_$TransactionActionEnumMap, json['action'],
              unknownValue: TransactionAction.artemisUnknown)
          ..rechargeType = $enumDecodeNullable(
              _$RiderRechargeTransactionTypeEnumMap, json['rechargeType'],
              unknownValue: RiderRechargeTransactionType.artemisUnknown);

Map<String, dynamic>
    _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacionToJson(
            Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
                instance) =>
        <String, dynamic>{
          'createdAt': fromDartDateTimeToGraphQLTimestamp(instance.createdAt),
          'amount': instance.amount,
          'currency': instance.currency,
          'refrenceNumber': instance.refrenceNumber,
          'deductType':
              _$RiderDeductTransactionTypeEnumMap[instance.deductType],
          'action': _$TransactionActionEnumMap[instance.action],
          'rechargeType':
              _$RiderRechargeTransactionTypeEnumMap[instance.rechargeType],
        };

const _$RiderDeductTransactionTypeEnumMap = {
  RiderDeductTransactionType.orderFee: 'OrderFee',
  RiderDeductTransactionType.withdraw: 'Withdraw',
  RiderDeductTransactionType.correction: 'Correction',
  RiderDeductTransactionType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$TransactionActionEnumMap = {
  TransactionAction.recharge: 'Recharge',
  TransactionAction.deduct: 'Deduct',
  TransactionAction.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$RiderRechargeTransactionTypeEnumMap = {
  RiderRechargeTransactionType.bankTransfer: 'BankTransfer',
  RiderRechargeTransactionType.gift: 'Gift',
  RiderRechargeTransactionType.correction: 'Correction',
  RiderRechargeTransactionType.inAppPayment: 'InAppPayment',
  RiderRechargeTransactionType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Wallet$Query$RiderTransacionConnection$RiderTransacionEdge
    _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdgeFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$RiderTransacionConnection$RiderTransacionEdge()
          ..node =
              Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String,
    dynamic> _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdgeToJson(
        Wallet$Query$RiderTransacionConnection$RiderTransacionEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
    };

Wallet$Query$RiderTransacionConnection
    _$Wallet$Query$RiderTransacionConnectionFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$RiderTransacionConnection()
          ..edges = (json['edges'] as List<dynamic>)
              .map((e) =>
                  Wallet$Query$RiderTransacionConnection$RiderTransacionEdge
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$Wallet$Query$RiderTransacionConnectionToJson(
        Wallet$Query$RiderTransacionConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };

Wallet$Query _$Wallet$QueryFromJson(Map<String, dynamic> json) => Wallet$Query()
  ..riderWallets = (json['riderWallets'] as List<dynamic>)
      .map((e) => Wallet$Query$RiderWallet.fromJson(e as Map<String, dynamic>))
      .toList()
  ..riderTransacions = Wallet$Query$RiderTransacionConnection.fromJson(
      json['riderTransacions'] as Map<String, dynamic>);

Map<String, dynamic> _$Wallet$QueryToJson(Wallet$Query instance) =>
    <String, dynamic>{
      'riderWallets': instance.riderWallets.map((e) => e.toJson()).toList(),
      'riderTransacions': instance.riderTransacions.toJson(),
    };

PaymentGateways$Query$PaymentGateway
    _$PaymentGateways$Query$PaymentGatewayFromJson(Map<String, dynamic> json) =>
        PaymentGateways$Query$PaymentGateway()
          ..id = json['id'] as String
          ..title = json['title'] as String
          ..type = $enumDecode(_$PaymentGatewayTypeEnumMap, json['type'],
              unknownValue: PaymentGatewayType.artemisUnknown)
          ..publicKey = json['publicKey'] as String?;

Map<String, dynamic> _$PaymentGateways$Query$PaymentGatewayToJson(
        PaymentGateways$Query$PaymentGateway instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$PaymentGatewayTypeEnumMap[instance.type],
      'publicKey': instance.publicKey,
    };

const _$PaymentGatewayTypeEnumMap = {
  PaymentGatewayType.stripe: 'Stripe',
  PaymentGatewayType.brainTree: 'BrainTree',
  PaymentGatewayType.payPal: 'PayPal',
  PaymentGatewayType.paytm: 'Paytm',
  PaymentGatewayType.razorpay: 'Razorpay',
  PaymentGatewayType.paystack: 'Paystack',
  PaymentGatewayType.payU: 'PayU',
  PaymentGatewayType.instamojo: 'Instamojo',
  PaymentGatewayType.flutterwave: 'Flutterwave',
  PaymentGatewayType.payGate: 'PayGate',
  PaymentGatewayType.mips: 'MIPS',
  PaymentGatewayType.mercadoPago: 'MercadoPago',
  PaymentGatewayType.amazonPaymentServices: 'AmazonPaymentServices',
  PaymentGatewayType.myTMoney: 'MyTMoney',
  PaymentGatewayType.wayForPay: 'WayForPay',
  PaymentGatewayType.customLink: 'CustomLink',
  PaymentGatewayType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

PaymentGateways$Query _$PaymentGateways$QueryFromJson(
        Map<String, dynamic> json) =>
    PaymentGateways$Query()
      ..paymentGateways = (json['paymentGateways'] as List<dynamic>)
          .map((e) => PaymentGateways$Query$PaymentGateway.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PaymentGateways$QueryToJson(
        PaymentGateways$Query instance) =>
    <String, dynamic>{
      'paymentGateways':
          instance.paymentGateways.map((e) => e.toJson()).toList(),
    };

TopUpWallet$Mutation$TopUpWalletResponse
    _$TopUpWallet$Mutation$TopUpWalletResponseFromJson(
            Map<String, dynamic> json) =>
        TopUpWallet$Mutation$TopUpWalletResponse()
          ..status = $enumDecode(_$TopUpWalletStatusEnumMap, json['status'],
              unknownValue: TopUpWalletStatus.artemisUnknown)
          ..url = json['url'] as String;

Map<String, dynamic> _$TopUpWallet$Mutation$TopUpWalletResponseToJson(
        TopUpWallet$Mutation$TopUpWalletResponse instance) =>
    <String, dynamic>{
      'status': _$TopUpWalletStatusEnumMap[instance.status],
      'url': instance.url,
    };

const _$TopUpWalletStatusEnumMap = {
  TopUpWalletStatus.ok: 'OK',
  TopUpWalletStatus.redirect: 'Redirect',
  TopUpWalletStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

TopUpWallet$Mutation _$TopUpWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    TopUpWallet$Mutation()
      ..topUpWallet = TopUpWallet$Mutation$TopUpWalletResponse.fromJson(
          json['topUpWallet'] as Map<String, dynamic>);

Map<String, dynamic> _$TopUpWallet$MutationToJson(
        TopUpWallet$Mutation instance) =>
    <String, dynamic>{
      'topUpWallet': instance.topUpWallet.toJson(),
    };

TopUpWalletInput _$TopUpWalletInputFromJson(Map<String, dynamic> json) =>
    TopUpWalletInput(
      gatewayId: json['gatewayId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      token: json['token'] as String?,
      pin: (json['pin'] as num?)?.toDouble(),
      otp: (json['otp'] as num?)?.toDouble(),
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$TopUpWalletInputToJson(TopUpWalletInput instance) =>
    <String, dynamic>{
      'gatewayId': instance.gatewayId,
      'amount': instance.amount,
      'currency': instance.currency,
      'token': instance.token,
      'pin': instance.pin,
      'otp': instance.otp,
      'transactionId': instance.transactionId,
    };

GetCurrentOrder$Query$CurrentOrder$Order
    _$GetCurrentOrder$Query$CurrentOrder$OrderFromJson(
            Map<String, dynamic> json) =>
        GetCurrentOrder$Query$CurrentOrder$Order()
          ..id = json['id'] as String
          ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
              unknownValue: OrderStatus.artemisUnknown)
          ..points = (json['points'] as List<dynamic>)
              .map((e) =>
                  CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
              .toList()
          ..driver = json['driver'] == null
              ? null
              : CurrentOrderMixin$Driver.fromJson(
                  json['driver'] as Map<String, dynamic>)
          ..service = CurrentOrderMixin$Service.fromJson(
              json['service'] as Map<String, dynamic>)
          ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
              json['etaPickup'] as int?)
          ..paidAmount = (json['paidAmount'] as num).toDouble()
          ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
          ..costBest = (json['costBest'] as num).toDouble()
          ..currency = json['currency'] as String
          ..addresses = (json['addresses'] as List<dynamic>)
              .map((e) => e as String)
              .toList();

Map<String, dynamic> _$GetCurrentOrder$Query$CurrentOrder$OrderToJson(
        GetCurrentOrder$Query$CurrentOrder$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'points': instance.points.map((e) => e.toJson()).toList(),
      'driver': instance.driver?.toJson(),
      'service': instance.service.toJson(),
      'etaPickup': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.etaPickup),
      'paidAmount': instance.paidAmount,
      'costAfterCoupon': instance.costAfterCoupon,
      'costBest': instance.costBest,
      'currency': instance.currency,
      'addresses': instance.addresses,
    };

GetCurrentOrder$Query$CurrentOrder$Point
    _$GetCurrentOrder$Query$CurrentOrder$PointFromJson(
            Map<String, dynamic> json) =>
        GetCurrentOrder$Query$CurrentOrder$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetCurrentOrder$Query$CurrentOrder$PointToJson(
        GetCurrentOrder$Query$CurrentOrder$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetCurrentOrder$Query$CurrentOrder _$GetCurrentOrder$Query$CurrentOrderFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query$CurrentOrder()
      ..order = GetCurrentOrder$Query$CurrentOrder$Order.fromJson(
          json['order'] as Map<String, dynamic>)
      ..driverLocation = json['driverLocation'] == null
          ? null
          : GetCurrentOrder$Query$CurrentOrder$Point.fromJson(
              json['driverLocation'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCurrentOrder$Query$CurrentOrderToJson(
        GetCurrentOrder$Query$CurrentOrder instance) =>
    <String, dynamic>{
      'order': instance.order.toJson(),
      'driverLocation': instance.driverLocation?.toJson(),
    };

GetCurrentOrder$Query _$GetCurrentOrder$QueryFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query()
      ..currentOrderWithLocation = GetCurrentOrder$Query$CurrentOrder.fromJson(
          json['currentOrderWithLocation'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCurrentOrder$QueryToJson(
        GetCurrentOrder$Query instance) =>
    <String, dynamic>{
      'currentOrderWithLocation': instance.currentOrderWithLocation.toJson(),
    };

CurrentOrderMixin$Point _$CurrentOrderMixin$PointFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$CurrentOrderMixin$PointToJson(
        CurrentOrderMixin$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CurrentOrderMixin$Driver$Media _$CurrentOrderMixin$Driver$MediaFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$Media()..address = json['address'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$MediaToJson(
        CurrentOrderMixin$Driver$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

CurrentOrderMixin$Driver$CarModel _$CurrentOrderMixin$Driver$CarModelFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$CarModel()..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$CarModelToJson(
        CurrentOrderMixin$Driver$CarModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CurrentOrderMixin$Driver$CarColor _$CurrentOrderMixin$Driver$CarColorFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$CarColor()..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$CarColorToJson(
        CurrentOrderMixin$Driver$CarColor instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CurrentOrderMixin$Driver _$CurrentOrderMixin$DriverFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver()
      ..firstName = json['firstName'] as String
      ..lastName = json['lastName'] as String
      ..media = json['media'] == null
          ? null
          : CurrentOrderMixin$Driver$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..mobileNumber = json['mobileNumber'] as String
      ..carPlate = json['carPlate'] as String?
      ..car = json['car'] == null
          ? null
          : CurrentOrderMixin$Driver$CarModel.fromJson(
              json['car'] as Map<String, dynamic>)
      ..carColor = json['carColor'] == null
          ? null
          : CurrentOrderMixin$Driver$CarColor.fromJson(
              json['carColor'] as Map<String, dynamic>)
      ..rating = json['rating'] as int?;

Map<String, dynamic> _$CurrentOrderMixin$DriverToJson(
        CurrentOrderMixin$Driver instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'media': instance.media?.toJson(),
      'mobileNumber': instance.mobileNumber,
      'carPlate': instance.carPlate,
      'car': instance.car?.toJson(),
      'carColor': instance.carColor?.toJson(),
      'rating': instance.rating,
    };

CurrentOrderMixin$Service$Media _$CurrentOrderMixin$Service$MediaFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Service$Media()..address = json['address'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Service$MediaToJson(
        CurrentOrderMixin$Service$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

CurrentOrderMixin$Service _$CurrentOrderMixin$ServiceFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Service()
      ..media = CurrentOrderMixin$Service$Media.fromJson(
          json['media'] as Map<String, dynamic>)
      ..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$ServiceToJson(
        CurrentOrderMixin$Service instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'name': instance.name,
    };

CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$Media
    _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic>
    _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$MediaToJson(
            CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$Media
                instance) =>
        <String, dynamic>{
          'address': instance.address,
        };

CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service
    _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$ServiceFromJson(
            Map<String, dynamic> json) =>
        CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service()
          ..id = json['id'] as String
          ..name = json['name'] as String
          ..media =
              CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$Media
                  .fromJson(json['media'] as Map<String, dynamic>)
          ..cost = (json['cost'] as num).toDouble();

Map<String, dynamic>
    _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$ServiceToJson(
            CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
          'media': instance.media.toJson(),
          'cost': instance.cost,
        };

CalculateFare$Mutation$CalculateFareDTO$ServiceCategory
    _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategoryFromJson(
            Map<String, dynamic> json) =>
        CalculateFare$Mutation$CalculateFareDTO$ServiceCategory()
          ..id = json['id'] as String
          ..name = json['name'] as String
          ..services = (json['services'] as List<dynamic>)
              .map((e) =>
                  CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategoryToJson(
            CalculateFare$Mutation$CalculateFareDTO$ServiceCategory instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
          'services': instance.services.map((e) => e.toJson()).toList(),
        };

CalculateFare$Mutation$CalculateFareDTO
    _$CalculateFare$Mutation$CalculateFareDTOFromJson(
            Map<String, dynamic> json) =>
        CalculateFare$Mutation$CalculateFareDTO()
          ..distance = (json['distance'] as num).toDouble()
          ..duration = (json['duration'] as num).toDouble()
          ..currency = json['currency'] as String
          ..services = (json['services'] as List<dynamic>)
              .map((e) =>
                  CalculateFare$Mutation$CalculateFareDTO$ServiceCategory
                      .fromJson(e as Map<String, dynamic>))
              .toList()
          ..error = $enumDecodeNullable(
              _$CalculateFareErrorEnumMap, json['error'],
              unknownValue: CalculateFareError.artemisUnknown);

Map<String, dynamic> _$CalculateFare$Mutation$CalculateFareDTOToJson(
        CalculateFare$Mutation$CalculateFareDTO instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'currency': instance.currency,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'error': _$CalculateFareErrorEnumMap[instance.error],
    };

const _$CalculateFareErrorEnumMap = {
  CalculateFareError.regionUnsupported: 'RegionUnsupported',
  CalculateFareError.noServiceInRegion: 'NoServiceInRegion',
  CalculateFareError.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CalculateFare$Mutation _$CalculateFare$MutationFromJson(
        Map<String, dynamic> json) =>
    CalculateFare$Mutation()
      ..calculateFare = CalculateFare$Mutation$CalculateFareDTO.fromJson(
          json['calculateFare'] as Map<String, dynamic>);

Map<String, dynamic> _$CalculateFare$MutationToJson(
        CalculateFare$Mutation instance) =>
    <String, dynamic>{
      'calculateFare': instance.calculateFare.toJson(),
    };

PointInput _$PointInputFromJson(Map<String, dynamic> json) => PointInput(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$PointInputToJson(PointInput instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CreateOrder$Mutation$Order _$CreateOrder$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    CreateOrder$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$CreateOrder$Mutation$OrderToJson(
        CreateOrder$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'points': instance.points.map((e) => e.toJson()).toList(),
      'driver': instance.driver?.toJson(),
      'service': instance.service.toJson(),
      'etaPickup': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.etaPickup),
      'paidAmount': instance.paidAmount,
      'costAfterCoupon': instance.costAfterCoupon,
      'costBest': instance.costBest,
      'currency': instance.currency,
      'addresses': instance.addresses,
    };

CreateOrder$Mutation _$CreateOrder$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateOrder$Mutation()
      ..createOrder = CreateOrder$Mutation$Order.fromJson(
          json['createOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateOrder$MutationToJson(
        CreateOrder$Mutation instance) =>
    <String, dynamic>{
      'createOrder': instance.createOrder.toJson(),
    };

CreateOrderInput _$CreateOrderInputFromJson(Map<String, dynamic> json) =>
    CreateOrderInput(
      serviceId: json['serviceId'] as int,
      intervalMinutes: json['intervalMinutes'] as int,
      points: (json['points'] as List<dynamic>)
          .map((e) => PointInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      addresses:
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateOrderInputToJson(CreateOrderInput instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'intervalMinutes': instance.intervalMinutes,
      'points': instance.points.map((e) => e.toJson()).toList(),
      'addresses': instance.addresses,
    };

CancelOrder$Mutation$Order _$CancelOrder$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    CancelOrder$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$CancelOrder$Mutation$OrderToJson(
        CancelOrder$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'points': instance.points.map((e) => e.toJson()).toList(),
      'driver': instance.driver?.toJson(),
      'service': instance.service.toJson(),
      'etaPickup': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.etaPickup),
      'paidAmount': instance.paidAmount,
      'costAfterCoupon': instance.costAfterCoupon,
      'costBest': instance.costBest,
      'currency': instance.currency,
      'addresses': instance.addresses,
    };

CancelOrder$Mutation _$CancelOrder$MutationFromJson(
        Map<String, dynamic> json) =>
    CancelOrder$Mutation()
      ..cancelOrder = CancelOrder$Mutation$Order.fromJson(
          json['cancelOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$CancelOrder$MutationToJson(
        CancelOrder$Mutation instance) =>
    <String, dynamic>{
      'cancelOrder': instance.cancelOrder.toJson(),
    };

UpdatedOrder$Subscription$Order$Point
    _$UpdatedOrder$Subscription$Order$PointFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$PointToJson(
        UpdatedOrder$Subscription$Order$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

UpdatedOrder$Subscription$Order$Driver$Media
    _$UpdatedOrder$Subscription$Order$Driver$MediaFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$MediaToJson(
        UpdatedOrder$Subscription$Order$Driver$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

UpdatedOrder$Subscription$Order$Driver$CarModel
    _$UpdatedOrder$Subscription$Order$Driver$CarModelFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$CarModel()
          ..name = json['name'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$CarModelToJson(
        UpdatedOrder$Subscription$Order$Driver$CarModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UpdatedOrder$Subscription$Order$Driver$CarColor
    _$UpdatedOrder$Subscription$Order$Driver$CarColorFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$CarColor()
          ..name = json['name'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$CarColorToJson(
        UpdatedOrder$Subscription$Order$Driver$CarColor instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UpdatedOrder$Subscription$Order$Driver
    _$UpdatedOrder$Subscription$Order$DriverFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver()
          ..firstName = json['firstName'] as String
          ..lastName = json['lastName'] as String
          ..media = json['media'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$Media.fromJson(
                  json['media'] as Map<String, dynamic>)
          ..mobileNumber = json['mobileNumber'] as String
          ..carPlate = json['carPlate'] as String?
          ..car = json['car'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$CarModel.fromJson(
                  json['car'] as Map<String, dynamic>)
          ..carColor = json['carColor'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$CarColor.fromJson(
                  json['carColor'] as Map<String, dynamic>)
          ..rating = json['rating'] as int?;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$DriverToJson(
        UpdatedOrder$Subscription$Order$Driver instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'media': instance.media?.toJson(),
      'mobileNumber': instance.mobileNumber,
      'carPlate': instance.carPlate,
      'car': instance.car?.toJson(),
      'carColor': instance.carColor?.toJson(),
      'rating': instance.rating,
    };

UpdatedOrder$Subscription$Order$Service$Media
    _$UpdatedOrder$Subscription$Order$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Service$MediaToJson(
        UpdatedOrder$Subscription$Order$Service$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

UpdatedOrder$Subscription$Order$Service
    _$UpdatedOrder$Subscription$Order$ServiceFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Service()
          ..media = UpdatedOrder$Subscription$Order$Service$Media.fromJson(
              json['media'] as Map<String, dynamic>)
          ..name = json['name'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$ServiceToJson(
        UpdatedOrder$Subscription$Order$Service instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'name': instance.name,
    };

UpdatedOrder$Subscription$Order _$UpdatedOrder$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    UpdatedOrder$Subscription$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) => UpdatedOrder$Subscription$Order$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : UpdatedOrder$Subscription$Order$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = UpdatedOrder$Subscription$Order$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$UpdatedOrder$Subscription$OrderToJson(
        UpdatedOrder$Subscription$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'points': instance.points.map((e) => e.toJson()).toList(),
      'driver': instance.driver?.toJson(),
      'service': instance.service.toJson(),
      'etaPickup': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.etaPickup),
      'paidAmount': instance.paidAmount,
      'costAfterCoupon': instance.costAfterCoupon,
      'costBest': instance.costBest,
      'currency': instance.currency,
      'addresses': instance.addresses,
    };

UpdatedOrder$Subscription _$UpdatedOrder$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    UpdatedOrder$Subscription()
      ..orderUpdated = UpdatedOrder$Subscription$Order.fromJson(
          json['orderUpdated'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdatedOrder$SubscriptionToJson(
        UpdatedOrder$Subscription instance) =>
    <String, dynamic>{
      'orderUpdated': instance.orderUpdated.toJson(),
    };

DriverLocationUpdated$Subscription$Point
    _$DriverLocationUpdated$Subscription$PointFromJson(
            Map<String, dynamic> json) =>
        DriverLocationUpdated$Subscription$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$DriverLocationUpdated$Subscription$PointToJson(
        DriverLocationUpdated$Subscription$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

DriverLocationUpdated$Subscription _$DriverLocationUpdated$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    DriverLocationUpdated$Subscription()
      ..driverLocationUpdated =
          DriverLocationUpdated$Subscription$Point.fromJson(
              json['driverLocationUpdated'] as Map<String, dynamic>);

Map<String, dynamic> _$DriverLocationUpdated$SubscriptionToJson(
        DriverLocationUpdated$Subscription instance) =>
    <String, dynamic>{
      'driverLocationUpdated': instance.driverLocationUpdated.toJson(),
    };

SubmitFeedback$Mutation$Order _$SubmitFeedback$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedback$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$SubmitFeedback$Mutation$OrderToJson(
        SubmitFeedback$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'points': instance.points.map((e) => e.toJson()).toList(),
      'driver': instance.driver?.toJson(),
      'service': instance.service.toJson(),
      'etaPickup': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.etaPickup),
      'paidAmount': instance.paidAmount,
      'costAfterCoupon': instance.costAfterCoupon,
      'costBest': instance.costBest,
      'currency': instance.currency,
      'addresses': instance.addresses,
    };

SubmitFeedback$Mutation _$SubmitFeedback$MutationFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedback$Mutation()
      ..submitReview = SubmitFeedback$Mutation$Order.fromJson(
          json['submitReview'] as Map<String, dynamic>);

Map<String, dynamic> _$SubmitFeedback$MutationToJson(
        SubmitFeedback$Mutation instance) =>
    <String, dynamic>{
      'submitReview': instance.submitReview.toJson(),
    };

GetDriversLocation$Query$Point _$GetDriversLocation$Query$PointFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocation$Query$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetDriversLocation$Query$PointToJson(
        GetDriversLocation$Query$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetDriversLocation$Query _$GetDriversLocation$QueryFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocation$Query()
      ..getDriversLocation = (json['getDriversLocation'] as List<dynamic>)
          .map((e) => GetDriversLocation$Query$Point.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetDriversLocation$QueryToJson(
        GetDriversLocation$Query instance) =>
    <String, dynamic>{
      'getDriversLocation':
          instance.getDriversLocation.map((e) => e.toJson()).toList(),
    };

ApplyCoupon$Mutation$Order _$ApplyCoupon$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    ApplyCoupon$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$ApplyCoupon$Mutation$OrderToJson(
        ApplyCoupon$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'points': instance.points.map((e) => e.toJson()).toList(),
      'driver': instance.driver?.toJson(),
      'service': instance.service.toJson(),
      'etaPickup': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.etaPickup),
      'paidAmount': instance.paidAmount,
      'costAfterCoupon': instance.costAfterCoupon,
      'costBest': instance.costBest,
      'currency': instance.currency,
      'addresses': instance.addresses,
    };

ApplyCoupon$Mutation _$ApplyCoupon$MutationFromJson(
        Map<String, dynamic> json) =>
    ApplyCoupon$Mutation()
      ..applyCoupon = ApplyCoupon$Mutation$Order.fromJson(
          json['applyCoupon'] as Map<String, dynamic>);

Map<String, dynamic> _$ApplyCoupon$MutationToJson(
        ApplyCoupon$Mutation instance) =>
    <String, dynamic>{
      'applyCoupon': instance.applyCoupon.toJson(),
    };

Login$Mutation$Login _$Login$Mutation$LoginFromJson(
        Map<String, dynamic> json) =>
    Login$Mutation$Login()..jwtToken = json['jwtToken'] as String;

Map<String, dynamic> _$Login$Mutation$LoginToJson(
        Login$Mutation$Login instance) =>
    <String, dynamic>{
      'jwtToken': instance.jwtToken,
    };

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) =>
    Login$Mutation()
      ..login =
          Login$Mutation$Login.fromJson(json['login'] as Map<String, dynamic>);

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login.toJson(),
    };

SendMessageArguments _$SendMessageArgumentsFromJson(
        Map<String, dynamic> json) =>
    SendMessageArguments(
      requestId: json['requestId'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$SendMessageArgumentsToJson(
        SendMessageArguments instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'content': instance.content,
    };

UpdateProfileArguments _$UpdateProfileArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileArguments(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.artemisUnknown),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UpdateProfileArgumentsToJson(
        UpdateProfileArguments instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': _$GenderEnumMap[instance.gender],
      'email': instance.email,
    };

CreateAddressArguments _$CreateAddressArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateAddressArguments(
      title: json['title'] as String,
      details: json['details'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateAddressArgumentsToJson(
        CreateAddressArguments instance) =>
    <String, dynamic>{
      'title': instance.title,
      'details': instance.details,
      'lat': instance.lat,
      'lng': instance.lng,
    };

DeleteAddressArguments _$DeleteAddressArgumentsFromJson(
        Map<String, dynamic> json) =>
    DeleteAddressArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$DeleteAddressArgumentsToJson(
        DeleteAddressArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

TopUpWalletArguments _$TopUpWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    TopUpWalletArguments(
      input: TopUpWalletInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopUpWalletArgumentsToJson(
        TopUpWalletArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };

CalculateFareArguments _$CalculateFareArgumentsFromJson(
        Map<String, dynamic> json) =>
    CalculateFareArguments(
      points: (json['points'] as List<dynamic>)
          .map((e) => PointInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CalculateFareArgumentsToJson(
        CalculateFareArguments instance) =>
    <String, dynamic>{
      'points': instance.points.map((e) => e.toJson()).toList(),
    };

CreateOrderArguments _$CreateOrderArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateOrderArguments(
      input: CreateOrderInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderArgumentsToJson(
        CreateOrderArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };

DriverLocationUpdatedArguments _$DriverLocationUpdatedArgumentsFromJson(
        Map<String, dynamic> json) =>
    DriverLocationUpdatedArguments(
      driverId: json['driverId'] as String,
    );

Map<String, dynamic> _$DriverLocationUpdatedArgumentsToJson(
        DriverLocationUpdatedArguments instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
    };

SubmitFeedbackArguments _$SubmitFeedbackArgumentsFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedbackArguments(
      score: json['score'] as int,
      description: json['description'] as String,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$SubmitFeedbackArgumentsToJson(
        SubmitFeedbackArguments instance) =>
    <String, dynamic>{
      'score': instance.score,
      'description': instance.description,
      'orderId': instance.orderId,
    };

GetDriversLocationArguments _$GetDriversLocationArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocationArguments(
      point: json['point'] == null
          ? null
          : PointInput.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDriversLocationArgumentsToJson(
        GetDriversLocationArguments instance) =>
    <String, dynamic>{
      'point': instance.point?.toJson(),
    };

ApplyCouponArguments _$ApplyCouponArgumentsFromJson(
        Map<String, dynamic> json) =>
    ApplyCouponArguments(
      code: json['code'] as String,
    );

Map<String, dynamic> _$ApplyCouponArgumentsToJson(
        ApplyCouponArguments instance) =>
    <String, dynamic>{
      'code': instance.code,
    };

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) =>
    LoginArguments(
      firebaseToken: json['firebaseToken'] as String,
    );

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) =>
    <String, dynamic>{
      'firebaseToken': instance.firebaseToken,
    };
