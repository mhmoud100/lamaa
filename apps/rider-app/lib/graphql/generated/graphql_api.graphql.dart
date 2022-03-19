// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import '../scalars/timestamp.dart';
import '../scalars/connection_cursor.dart';
part 'graphql_api.graphql.g.dart';

mixin ChatRiderMixin {
  late String id;
  String? firstName;
  String? lastName;
  ChatRiderMixin$Media? media;
}
mixin ChatDriverMixin {
  late String id;
  late String firstName;
  late String lastName;
  ChatDriverMixin$Media? media;
}
mixin ChatMessageMixin {
  late String id;
  late String content;
  late bool sentByDriver;
}
mixin HistoryOrderItemMixin {
  late List<HistoryOrderItemMixin$OrderEdge> edges;
  late HistoryOrderItemMixin$PageInfo pageInfo;
}
mixin CurrentOrderMixin {
  late String id;
  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;
  late List<CurrentOrderMixin$Point> points;
  CurrentOrderMixin$Driver? driver;
  late CurrentOrderMixin$Service service;
  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? etaPickup;
  late double paidAmount;
  late double costAfterCoupon;
  late double costBest;
  late String currency;
  late List<String> addresses;
}
mixin PointMixin {
  late double lat;
  late double lng;
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Order$Rider extends JsonSerializable
    with EquatableMixin, ChatRiderMixin {
  GetMessages$Query$Order$Rider();

  factory GetMessages$Query$Order$Rider.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$Order$RiderFromJson(json);

  @override
  List<Object?> get props => [id, firstName, lastName, media];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$Order$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Order$Driver extends JsonSerializable
    with EquatableMixin, ChatDriverMixin {
  GetMessages$Query$Order$Driver();

  factory GetMessages$Query$Order$Driver.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$Order$DriverFromJson(json);

  @override
  List<Object?> get props => [id, firstName, lastName, media];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$Order$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Order$OrderMessage extends JsonSerializable
    with EquatableMixin, ChatMessageMixin {
  GetMessages$Query$Order$OrderMessage();

  factory GetMessages$Query$Order$OrderMessage.fromJson(
          Map<String, dynamic> json) =>
      _$GetMessages$Query$Order$OrderMessageFromJson(json);

  @override
  List<Object?> get props => [id, content, sentByDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$GetMessages$Query$Order$OrderMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Order extends JsonSerializable with EquatableMixin {
  GetMessages$Query$Order();

  factory GetMessages$Query$Order.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$OrderFromJson(json);

  late String id;

  late GetMessages$Query$Order$Rider rider;

  GetMessages$Query$Order$Driver? driver;

  late List<GetMessages$Query$Order$OrderMessage> conversations;

  @override
  List<Object?> get props => [id, rider, driver, conversations];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query extends JsonSerializable with EquatableMixin {
  GetMessages$Query();

  factory GetMessages$Query.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$QueryFromJson(json);

  late GetMessages$Query$Order currentOrder;

  @override
  List<Object?> get props => [currentOrder];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChatRiderMixin$Media extends JsonSerializable with EquatableMixin {
  ChatRiderMixin$Media();

  factory ChatRiderMixin$Media.fromJson(Map<String, dynamic> json) =>
      _$ChatRiderMixin$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$ChatRiderMixin$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChatDriverMixin$Media extends JsonSerializable with EquatableMixin {
  ChatDriverMixin$Media();

  factory ChatDriverMixin$Media.fromJson(Map<String, dynamic> json) =>
      _$ChatDriverMixin$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$ChatDriverMixin$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessage$Mutation$OrderMessage extends JsonSerializable
    with EquatableMixin, ChatMessageMixin {
  SendMessage$Mutation$OrderMessage();

  factory SendMessage$Mutation$OrderMessage.fromJson(
          Map<String, dynamic> json) =>
      _$SendMessage$Mutation$OrderMessageFromJson(json);

  @override
  List<Object?> get props => [id, content, sentByDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$SendMessage$Mutation$OrderMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessage$Mutation extends JsonSerializable with EquatableMixin {
  SendMessage$Mutation();

  factory SendMessage$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SendMessage$MutationFromJson(json);

  late SendMessage$Mutation$OrderMessage createOneOrderMessage;

  @override
  List<Object?> get props => [createOneOrderMessage];
  @override
  Map<String, dynamic> toJson() => _$SendMessage$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewMessageReceived$Subscription$OrderMessage extends JsonSerializable
    with EquatableMixin, ChatMessageMixin {
  NewMessageReceived$Subscription$OrderMessage();

  factory NewMessageReceived$Subscription$OrderMessage.fromJson(
          Map<String, dynamic> json) =>
      _$NewMessageReceived$Subscription$OrderMessageFromJson(json);

  @override
  List<Object?> get props => [id, content, sentByDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$NewMessageReceived$Subscription$OrderMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewMessageReceived$Subscription extends JsonSerializable
    with EquatableMixin {
  NewMessageReceived$Subscription();

  factory NewMessageReceived$Subscription.fromJson(Map<String, dynamic> json) =>
      _$NewMessageReceived$SubscriptionFromJson(json);

  late NewMessageReceived$Subscription$OrderMessage newMessageReceived;

  @override
  List<Object?> get props => [newMessageReceived];
  @override
  Map<String, dynamic> toJson() =>
      _$NewMessageReceived$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
    extends JsonSerializable with EquatableMixin {
  GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement();

  factory GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement.fromJson(
          Map<String, dynamic> json) =>
      _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$AnnouncementFromJson(
          json);

  late String id;

  late String title;

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime startAt;

  late String description;

  @override
  List<Object?> get props => [id, title, startAt, description];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$AnnouncementToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge
    extends JsonSerializable with EquatableMixin {
  GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge();

  factory GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge.fromJson(
          Map<String, dynamic> json) =>
      _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdgeFromJson(
          json);

  late GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
      node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdgeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetAnnouncements$Query$AnnouncementConnection extends JsonSerializable
    with EquatableMixin {
  GetAnnouncements$Query$AnnouncementConnection();

  factory GetAnnouncements$Query$AnnouncementConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GetAnnouncements$Query$AnnouncementConnectionFromJson(json);

  late List<GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge>
      edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAnnouncements$Query$AnnouncementConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAnnouncements$Query extends JsonSerializable with EquatableMixin {
  GetAnnouncements$Query();

  factory GetAnnouncements$Query.fromJson(Map<String, dynamic> json) =>
      _$GetAnnouncements$QueryFromJson(json);

  late GetAnnouncements$Query$AnnouncementConnection announcements;

  @override
  List<Object?> get props => [announcements];
  @override
  Map<String, dynamic> toJson() => _$GetAnnouncements$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRider$Query$Rider$Media extends JsonSerializable with EquatableMixin {
  GetRider$Query$Rider$Media();

  factory GetRider$Query$Rider$Media.fromJson(Map<String, dynamic> json) =>
      _$GetRider$Query$Rider$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$GetRider$Query$Rider$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRider$Query$Rider extends JsonSerializable with EquatableMixin {
  GetRider$Query$Rider();

  factory GetRider$Query$Rider.fromJson(Map<String, dynamic> json) =>
      _$GetRider$Query$RiderFromJson(json);

  late String id;

  late String mobileNumber;

  String? firstName;

  String? lastName;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  Gender? gender;

  String? email;

  GetRider$Query$Rider$Media? media;

  @override
  List<Object?> get props =>
      [id, mobileNumber, firstName, lastName, gender, email, media];
  @override
  Map<String, dynamic> toJson() => _$GetRider$Query$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRider$Query extends JsonSerializable with EquatableMixin {
  GetRider$Query();

  factory GetRider$Query.fromJson(Map<String, dynamic> json) =>
      _$GetRider$QueryFromJson(json);

  GetRider$Query$Rider? rider;

  @override
  List<Object?> get props => [rider];
  @override
  Map<String, dynamic> toJson() => _$GetRider$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation$Rider extends JsonSerializable
    with EquatableMixin {
  UpdateProfile$Mutation$Rider();

  factory UpdateProfile$Mutation$Rider.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$Mutation$RiderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$Mutation$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation extends JsonSerializable with EquatableMixin {
  UpdateProfile$Mutation();

  factory UpdateProfile$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$MutationFromJson(json);

  late UpdateProfile$Mutation$Rider updateOneRider;

  @override
  List<Object?> get props => [updateOneRider];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAddresses$Query$RiderAddress$Point extends JsonSerializable
    with EquatableMixin {
  GetAddresses$Query$RiderAddress$Point();

  factory GetAddresses$Query$RiderAddress$Point.fromJson(
          Map<String, dynamic> json) =>
      _$GetAddresses$Query$RiderAddress$PointFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAddresses$Query$RiderAddress$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAddresses$Query$RiderAddress extends JsonSerializable
    with EquatableMixin {
  GetAddresses$Query$RiderAddress();

  factory GetAddresses$Query$RiderAddress.fromJson(Map<String, dynamic> json) =>
      _$GetAddresses$Query$RiderAddressFromJson(json);

  late String id;

  late String title;

  @JsonKey(unknownEnumValue: RiderAddressType.artemisUnknown)
  late RiderAddressType type;

  late String details;

  late GetAddresses$Query$RiderAddress$Point location;

  @override
  List<Object?> get props => [id, title, type, details, location];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAddresses$Query$RiderAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAddresses$Query extends JsonSerializable with EquatableMixin {
  GetAddresses$Query();

  factory GetAddresses$Query.fromJson(Map<String, dynamic> json) =>
      _$GetAddresses$QueryFromJson(json);

  late List<GetAddresses$Query$RiderAddress> riderAddresses;

  @override
  List<Object?> get props => [riderAddresses];
  @override
  Map<String, dynamic> toJson() => _$GetAddresses$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateAddress$Mutation$RiderAddress extends JsonSerializable
    with EquatableMixin {
  CreateAddress$Mutation$RiderAddress();

  factory CreateAddress$Mutation$RiderAddress.fromJson(
          Map<String, dynamic> json) =>
      _$CreateAddress$Mutation$RiderAddressFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$CreateAddress$Mutation$RiderAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateAddress$Mutation extends JsonSerializable with EquatableMixin {
  CreateAddress$Mutation();

  factory CreateAddress$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateAddress$MutationFromJson(json);

  late CreateAddress$Mutation$RiderAddress createOneRiderAddress;

  @override
  List<Object?> get props => [createOneRiderAddress];
  @override
  Map<String, dynamic> toJson() => _$CreateAddress$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteAddress$Mutation$RiderAddressDeleteResponse extends JsonSerializable
    with EquatableMixin {
  DeleteAddress$Mutation$RiderAddressDeleteResponse();

  factory DeleteAddress$Mutation$RiderAddressDeleteResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAddress$Mutation$RiderAddressDeleteResponseFromJson(json);

  String? id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$DeleteAddress$Mutation$RiderAddressDeleteResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteAddress$Mutation extends JsonSerializable with EquatableMixin {
  DeleteAddress$Mutation();

  factory DeleteAddress$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddress$MutationFromJson(json);

  late DeleteAddress$Mutation$RiderAddressDeleteResponse deleteOneRiderAddress;

  @override
  List<Object?> get props => [deleteOneRiderAddress];
  @override
  Map<String, dynamic> toJson() => _$DeleteAddress$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHistory$Query$Completed extends JsonSerializable
    with EquatableMixin, HistoryOrderItemMixin {
  GetHistory$Query$Completed();

  factory GetHistory$Query$Completed.fromJson(Map<String, dynamic> json) =>
      _$GetHistory$Query$CompletedFromJson(json);

  @override
  List<Object?> get props => [edges, pageInfo];
  @override
  Map<String, dynamic> toJson() => _$GetHistory$Query$CompletedToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHistory$Query$Canceled extends JsonSerializable
    with EquatableMixin, HistoryOrderItemMixin {
  GetHistory$Query$Canceled();

  factory GetHistory$Query$Canceled.fromJson(Map<String, dynamic> json) =>
      _$GetHistory$Query$CanceledFromJson(json);

  @override
  List<Object?> get props => [edges, pageInfo];
  @override
  Map<String, dynamic> toJson() => _$GetHistory$Query$CanceledToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHistory$Query extends JsonSerializable with EquatableMixin {
  GetHistory$Query();

  factory GetHistory$Query.fromJson(Map<String, dynamic> json) =>
      _$GetHistory$QueryFromJson(json);

  late GetHistory$Query$Completed completed;

  late GetHistory$Query$Canceled canceled;

  @override
  List<Object?> get props => [completed, canceled];
  @override
  Map<String, dynamic> toJson() => _$GetHistory$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order$PaymentGateway
    extends JsonSerializable with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order$PaymentGateway();

  factory HistoryOrderItemMixin$OrderEdge$Order$PaymentGateway.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$Order$PaymentGatewayFromJson(json);

  late String title;

  @override
  List<Object?> get props => [title];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdge$Order$PaymentGatewayToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order$Driver extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order$Driver();

  factory HistoryOrderItemMixin$OrderEdge$Order$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$Order$DriverFromJson(json);

  late String firstName;

  late String lastName;

  @override
  List<Object?> get props => [firstName, lastName];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdge$Order$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order$Service$Media
    extends JsonSerializable with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order$Service$Media();

  factory HistoryOrderItemMixin$OrderEdge$Order$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$Order$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdge$Order$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order$Service extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order$Service();

  factory HistoryOrderItemMixin$OrderEdge$Order$Service.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$Order$ServiceFromJson(json);

  late HistoryOrderItemMixin$OrderEdge$Order$Service$Media media;

  late String name;

  @override
  List<Object?> get props => [media, name];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdge$Order$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order();

  factory HistoryOrderItemMixin$OrderEdge$Order.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$OrderFromJson(json);

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime createdOn;

  late List<String> addresses;

  late String currency;

  late double costAfterCoupon;

  HistoryOrderItemMixin$OrderEdge$Order$PaymentGateway? paymentGateway;

  HistoryOrderItemMixin$OrderEdge$Order$Driver? driver;

  late HistoryOrderItemMixin$OrderEdge$Order$Service service;

  @override
  List<Object?> get props => [
        status,
        createdOn,
        addresses,
        currency,
        costAfterCoupon,
        paymentGateway,
        driver,
        service
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdge$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge();

  factory HistoryOrderItemMixin$OrderEdge.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdgeFromJson(json);

  late HistoryOrderItemMixin$OrderEdge$Order node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$PageInfo extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$PageInfo();

  factory HistoryOrderItemMixin$PageInfo.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$PageInfoFromJson(json);

  bool? hasNextPage;

  @JsonKey(
      fromJson: fromGraphQLConnectionCursorNullableToDartStringNullable,
      toJson: fromDartStringNullableToGraphQLConnectionCursorNullable)
  String? endCursor;

  @JsonKey(
      fromJson: fromGraphQLConnectionCursorNullableToDartStringNullable,
      toJson: fromDartStringNullableToGraphQLConnectionCursorNullable)
  String? startCursor;

  bool? hasPreviousPage;

  @override
  List<Object?> get props =>
      [hasNextPage, endCursor, startCursor, hasPreviousPage];
  @override
  Map<String, dynamic> toJson() => _$HistoryOrderItemMixin$PageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$RiderWallet extends JsonSerializable with EquatableMixin {
  Wallet$Query$RiderWallet();

  factory Wallet$Query$RiderWallet.fromJson(Map<String, dynamic> json) =>
      _$Wallet$Query$RiderWalletFromJson(json);

  late String id;

  late double balance;

  late String currency;

  @override
  List<Object?> get props => [id, balance, currency];
  @override
  Map<String, dynamic> toJson() => _$Wallet$Query$RiderWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
    extends JsonSerializable with EquatableMixin {
  Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion();

  factory Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacionFromJson(
          json);

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime createdAt;

  late double amount;

  late String currency;

  String? refrenceNumber;

  @JsonKey(unknownEnumValue: RiderDeductTransactionType.artemisUnknown)
  RiderDeductTransactionType? deductType;

  @JsonKey(unknownEnumValue: TransactionAction.artemisUnknown)
  late TransactionAction action;

  @JsonKey(unknownEnumValue: RiderRechargeTransactionType.artemisUnknown)
  RiderRechargeTransactionType? rechargeType;

  @override
  List<Object?> get props => [
        createdAt,
        amount,
        currency,
        refrenceNumber,
        deductType,
        action,
        rechargeType
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacionToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$RiderTransacionConnection$RiderTransacionEdge
    extends JsonSerializable with EquatableMixin {
  Wallet$Query$RiderTransacionConnection$RiderTransacionEdge();

  factory Wallet$Query$RiderTransacionConnection$RiderTransacionEdge.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdgeFromJson(
          json);

  late Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
      node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$RiderTransacionConnection extends JsonSerializable
    with EquatableMixin {
  Wallet$Query$RiderTransacionConnection();

  factory Wallet$Query$RiderTransacionConnection.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$RiderTransacionConnectionFromJson(json);

  late List<Wallet$Query$RiderTransacionConnection$RiderTransacionEdge> edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$RiderTransacionConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query extends JsonSerializable with EquatableMixin {
  Wallet$Query();

  factory Wallet$Query.fromJson(Map<String, dynamic> json) =>
      _$Wallet$QueryFromJson(json);

  late List<Wallet$Query$RiderWallet> riderWallets;

  late Wallet$Query$RiderTransacionConnection riderTransacions;

  @override
  List<Object?> get props => [riderWallets, riderTransacions];
  @override
  Map<String, dynamic> toJson() => _$Wallet$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentGateways$Query$PaymentGateway extends JsonSerializable
    with EquatableMixin {
  PaymentGateways$Query$PaymentGateway();

  factory PaymentGateways$Query$PaymentGateway.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentGateways$Query$PaymentGatewayFromJson(json);

  late String id;

  late String title;

  @JsonKey(unknownEnumValue: PaymentGatewayType.artemisUnknown)
  late PaymentGatewayType type;

  String? publicKey;

  @override
  List<Object?> get props => [id, title, type, publicKey];
  @override
  Map<String, dynamic> toJson() =>
      _$PaymentGateways$Query$PaymentGatewayToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentGateways$Query extends JsonSerializable with EquatableMixin {
  PaymentGateways$Query();

  factory PaymentGateways$Query.fromJson(Map<String, dynamic> json) =>
      _$PaymentGateways$QueryFromJson(json);

  late List<PaymentGateways$Query$PaymentGateway> paymentGateways;

  @override
  List<Object?> get props => [paymentGateways];
  @override
  Map<String, dynamic> toJson() => _$PaymentGateways$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TopUpWallet$Mutation$TopUpWalletResponse extends JsonSerializable
    with EquatableMixin {
  TopUpWallet$Mutation$TopUpWalletResponse();

  factory TopUpWallet$Mutation$TopUpWalletResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TopUpWallet$Mutation$TopUpWalletResponseFromJson(json);

  @JsonKey(unknownEnumValue: TopUpWalletStatus.artemisUnknown)
  late TopUpWalletStatus status;

  late String url;

  @override
  List<Object?> get props => [status, url];
  @override
  Map<String, dynamic> toJson() =>
      _$TopUpWallet$Mutation$TopUpWalletResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TopUpWallet$Mutation extends JsonSerializable with EquatableMixin {
  TopUpWallet$Mutation();

  factory TopUpWallet$Mutation.fromJson(Map<String, dynamic> json) =>
      _$TopUpWallet$MutationFromJson(json);

  late TopUpWallet$Mutation$TopUpWalletResponse topUpWallet;

  @override
  List<Object?> get props => [topUpWallet];
  @override
  Map<String, dynamic> toJson() => _$TopUpWallet$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TopUpWalletInput extends JsonSerializable with EquatableMixin {
  TopUpWalletInput(
      {required this.gatewayId,
      required this.amount,
      required this.currency,
      this.token,
      this.pin,
      this.otp,
      this.transactionId});

  factory TopUpWalletInput.fromJson(Map<String, dynamic> json) =>
      _$TopUpWalletInputFromJson(json);

  late String gatewayId;

  late double amount;

  late String currency;

  String? token;

  double? pin;

  double? otp;

  String? transactionId;

  @override
  List<Object?> get props =>
      [gatewayId, amount, currency, token, pin, otp, transactionId];
  @override
  Map<String, dynamic> toJson() => _$TopUpWalletInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$CurrentOrder$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  GetCurrentOrder$Query$CurrentOrder$Order();

  factory GetCurrentOrder$Query$CurrentOrder$Order.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$CurrentOrder$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$CurrentOrder$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$CurrentOrder$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  GetCurrentOrder$Query$CurrentOrder$Point();

  factory GetCurrentOrder$Query$CurrentOrder$Point.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$CurrentOrder$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$CurrentOrder$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$CurrentOrder extends JsonSerializable
    with EquatableMixin {
  GetCurrentOrder$Query$CurrentOrder();

  factory GetCurrentOrder$Query$CurrentOrder.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$CurrentOrderFromJson(json);

  late GetCurrentOrder$Query$CurrentOrder$Order order;

  GetCurrentOrder$Query$CurrentOrder$Point? driverLocation;

  @override
  List<Object?> get props => [order, driverLocation];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$CurrentOrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query extends JsonSerializable with EquatableMixin {
  GetCurrentOrder$Query();

  factory GetCurrentOrder$Query.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrder$QueryFromJson(json);

  late GetCurrentOrder$Query$CurrentOrder currentOrderWithLocation;

  @override
  List<Object?> get props => [currentOrderWithLocation];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentOrder$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  CurrentOrderMixin$Point();

  factory CurrentOrderMixin$Point.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver$Media extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$Media();

  factory CurrentOrderMixin$Driver$Media.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver$CarModel extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$CarModel();

  factory CurrentOrderMixin$Driver$CarModel.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$CarModelFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Driver$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver$CarColor extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$CarColor();

  factory CurrentOrderMixin$Driver$CarColor.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$CarColorFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Driver$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Driver();

  factory CurrentOrderMixin$Driver.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$DriverFromJson(json);

  late String firstName;

  late String lastName;

  CurrentOrderMixin$Driver$Media? media;

  late String mobileNumber;

  String? carPlate;

  CurrentOrderMixin$Driver$CarModel? car;

  CurrentOrderMixin$Driver$CarColor? carColor;

  int? rating;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        media,
        mobileNumber,
        carPlate,
        car,
        carColor,
        rating
      ];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Service$Media extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Service$Media();

  factory CurrentOrderMixin$Service$Media.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Service extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Service();

  factory CurrentOrderMixin$Service.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$ServiceFromJson(json);

  late CurrentOrderMixin$Service$Media media;

  late String name;

  @override
  List<Object?> get props => [media, name];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$Media
    extends JsonSerializable with EquatableMixin {
  CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$Media();

  factory CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$MediaFromJson(
          json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$MediaToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service
    extends JsonSerializable with EquatableMixin {
  CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service();

  factory CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$ServiceFromJson(
          json);

  late String id;

  late String name;

  late CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service$Media
      media;

  late double cost;

  @override
  List<Object?> get props => [id, name, media, cost];
  @override
  Map<String, dynamic> toJson() =>
      _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$ServiceToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class CalculateFare$Mutation$CalculateFareDTO$ServiceCategory
    extends JsonSerializable with EquatableMixin {
  CalculateFare$Mutation$CalculateFareDTO$ServiceCategory();

  factory CalculateFare$Mutation$CalculateFareDTO$ServiceCategory.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategoryFromJson(json);

  late String id;

  late String name;

  late List<CalculateFare$Mutation$CalculateFareDTO$ServiceCategory$Service>
      services;

  @override
  List<Object?> get props => [id, name, services];
  @override
  Map<String, dynamic> toJson() =>
      _$CalculateFare$Mutation$CalculateFareDTO$ServiceCategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CalculateFare$Mutation$CalculateFareDTO extends JsonSerializable
    with EquatableMixin {
  CalculateFare$Mutation$CalculateFareDTO();

  factory CalculateFare$Mutation$CalculateFareDTO.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateFare$Mutation$CalculateFareDTOFromJson(json);

  late double distance;

  late double duration;

  late String currency;

  late List<CalculateFare$Mutation$CalculateFareDTO$ServiceCategory> services;

  @JsonKey(unknownEnumValue: CalculateFareError.artemisUnknown)
  CalculateFareError? error;

  @override
  List<Object?> get props => [distance, duration, currency, services, error];
  @override
  Map<String, dynamic> toJson() =>
      _$CalculateFare$Mutation$CalculateFareDTOToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CalculateFare$Mutation extends JsonSerializable with EquatableMixin {
  CalculateFare$Mutation();

  factory CalculateFare$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CalculateFare$MutationFromJson(json);

  late CalculateFare$Mutation$CalculateFareDTO calculateFare;

  @override
  List<Object?> get props => [calculateFare];
  @override
  Map<String, dynamic> toJson() => _$CalculateFare$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PointInput extends JsonSerializable with EquatableMixin {
  PointInput({required this.lat, required this.lng});

  factory PointInput.fromJson(Map<String, dynamic> json) =>
      _$PointInputFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$PointInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrder$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  CreateOrder$Mutation$Order();

  factory CreateOrder$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$CreateOrder$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses
      ];
  @override
  Map<String, dynamic> toJson() => _$CreateOrder$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrder$Mutation extends JsonSerializable with EquatableMixin {
  CreateOrder$Mutation();

  factory CreateOrder$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateOrder$MutationFromJson(json);

  late CreateOrder$Mutation$Order createOrder;

  @override
  List<Object?> get props => [createOrder];
  @override
  Map<String, dynamic> toJson() => _$CreateOrder$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderInput extends JsonSerializable with EquatableMixin {
  CreateOrderInput(
      {required this.serviceId,
      required this.intervalMinutes,
      required this.points,
      required this.addresses});

  factory CreateOrderInput.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderInputFromJson(json);

  late int serviceId;

  late int intervalMinutes;

  late List<PointInput> points;

  late List<String> addresses;

  @override
  List<Object?> get props => [serviceId, intervalMinutes, points, addresses];
  @override
  Map<String, dynamic> toJson() => _$CreateOrderInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelOrder$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  CancelOrder$Mutation$Order();

  factory CancelOrder$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$CancelOrder$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses
      ];
  @override
  Map<String, dynamic> toJson() => _$CancelOrder$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelOrder$Mutation extends JsonSerializable with EquatableMixin {
  CancelOrder$Mutation();

  factory CancelOrder$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CancelOrder$MutationFromJson(json);

  late CancelOrder$Mutation$Order cancelOrder;

  @override
  List<Object?> get props => [cancelOrder];
  @override
  Map<String, dynamic> toJson() => _$CancelOrder$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Point extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Point();

  factory UpdatedOrder$Subscription$Order$Point.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$PointFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$Media extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$Media();

  factory UpdatedOrder$Subscription$Order$Driver$Media.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$CarModel extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$CarModel();

  factory UpdatedOrder$Subscription$Order$Driver$CarModel.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$CarModelFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$CarColor extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$CarColor();

  factory UpdatedOrder$Subscription$Order$Driver$CarColor.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$CarColorFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver();

  factory UpdatedOrder$Subscription$Order$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$DriverFromJson(json);

  late String firstName;

  late String lastName;

  UpdatedOrder$Subscription$Order$Driver$Media? media;

  late String mobileNumber;

  String? carPlate;

  UpdatedOrder$Subscription$Order$Driver$CarModel? car;

  UpdatedOrder$Subscription$Order$Driver$CarColor? carColor;

  int? rating;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        media,
        mobileNumber,
        carPlate,
        car,
        carColor,
        rating
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Service$Media extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Service$Media();

  factory UpdatedOrder$Subscription$Order$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Service extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Service();

  factory UpdatedOrder$Subscription$Order$Service.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$ServiceFromJson(json);

  late UpdatedOrder$Subscription$Order$Service$Media media;

  late String name;

  @override
  List<Object?> get props => [media, name];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order();

  factory UpdatedOrder$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$OrderFromJson(json);

  late String id;

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;

  late List<UpdatedOrder$Subscription$Order$Point> points;

  UpdatedOrder$Subscription$Order$Driver? driver;

  late UpdatedOrder$Subscription$Order$Service service;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? etaPickup;

  late double paidAmount;

  late double costAfterCoupon;

  late double costBest;

  late String currency;

  late List<String> addresses;

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription extends JsonSerializable with EquatableMixin {
  UpdatedOrder$Subscription();

  factory UpdatedOrder$Subscription.fromJson(Map<String, dynamic> json) =>
      _$UpdatedOrder$SubscriptionFromJson(json);

  late UpdatedOrder$Subscription$Order orderUpdated;

  @override
  List<Object?> get props => [orderUpdated];
  @override
  Map<String, dynamic> toJson() => _$UpdatedOrder$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdated$Subscription$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  DriverLocationUpdated$Subscription$Point();

  factory DriverLocationUpdated$Subscription$Point.fromJson(
          Map<String, dynamic> json) =>
      _$DriverLocationUpdated$Subscription$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$DriverLocationUpdated$Subscription$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdated$Subscription extends JsonSerializable
    with EquatableMixin {
  DriverLocationUpdated$Subscription();

  factory DriverLocationUpdated$Subscription.fromJson(
          Map<String, dynamic> json) =>
      _$DriverLocationUpdated$SubscriptionFromJson(json);

  late DriverLocationUpdated$Subscription$Point driverLocationUpdated;

  @override
  List<Object?> get props => [driverLocationUpdated];
  @override
  Map<String, dynamic> toJson() =>
      _$DriverLocationUpdated$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedback$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  SubmitFeedback$Mutation$Order();

  factory SubmitFeedback$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedback$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses
      ];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedback$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedback$Mutation extends JsonSerializable with EquatableMixin {
  SubmitFeedback$Mutation();

  factory SubmitFeedback$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedback$MutationFromJson(json);

  late SubmitFeedback$Mutation$Order submitReview;

  @override
  List<Object?> get props => [submitReview];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedback$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocation$Query$Point extends JsonSerializable
    with EquatableMixin {
  GetDriversLocation$Query$Point();

  factory GetDriversLocation$Query$Point.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocation$Query$PointFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocation$Query$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocation$Query extends JsonSerializable with EquatableMixin {
  GetDriversLocation$Query();

  factory GetDriversLocation$Query.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocation$QueryFromJson(json);

  late List<GetDriversLocation$Query$Point> getDriversLocation;

  @override
  List<Object?> get props => [getDriversLocation];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocation$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApplyCoupon$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  ApplyCoupon$Mutation$Order();

  factory ApplyCoupon$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$ApplyCoupon$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses
      ];
  @override
  Map<String, dynamic> toJson() => _$ApplyCoupon$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApplyCoupon$Mutation extends JsonSerializable with EquatableMixin {
  ApplyCoupon$Mutation();

  factory ApplyCoupon$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ApplyCoupon$MutationFromJson(json);

  late ApplyCoupon$Mutation$Order applyCoupon;

  @override
  List<Object?> get props => [applyCoupon];
  @override
  Map<String, dynamic> toJson() => _$ApplyCoupon$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation$Login extends JsonSerializable with EquatableMixin {
  Login$Mutation$Login();

  factory Login$Mutation$Login.fromJson(Map<String, dynamic> json) =>
      _$Login$Mutation$LoginFromJson(json);

  late String jwtToken;

  @override
  List<Object?> get props => [jwtToken];
  @override
  Map<String, dynamic> toJson() => _$Login$Mutation$LoginToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation extends JsonSerializable with EquatableMixin {
  Login$Mutation();

  factory Login$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationFromJson(json);

  late Login$Mutation$Login login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() => _$Login$MutationToJson(this);
}

enum Gender {
  @JsonValue('Male')
  male,
  @JsonValue('Female')
  female,
  @JsonValue('Unknown')
  unknown,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum RiderAddressType {
  @JsonValue('Home')
  home,
  @JsonValue('Work')
  work,
  @JsonValue('Partner')
  partner,
  @JsonValue('Other')
  other,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum OrderStatus {
  @JsonValue('Requested')
  requested,
  @JsonValue('NotFound')
  notFound,
  @JsonValue('NoCloseFound')
  noCloseFound,
  @JsonValue('Found')
  found,
  @JsonValue('DriverAccepted')
  driverAccepted,
  @JsonValue('Arrived')
  arrived,
  @JsonValue('WaitingForPrePay')
  waitingForPrePay,
  @JsonValue('DriverCanceled')
  driverCanceled,
  @JsonValue('RiderCanceled')
  riderCanceled,
  @JsonValue('Started')
  started,
  @JsonValue('WaitingForPostPay')
  waitingForPostPay,
  @JsonValue('WaitingForReview')
  waitingForReview,
  @JsonValue('Finished')
  finished,
  @JsonValue('Booked')
  booked,
  @JsonValue('Expired')
  expired,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum RiderDeductTransactionType {
  @JsonValue('OrderFee')
  orderFee,
  @JsonValue('Withdraw')
  withdraw,
  @JsonValue('Correction')
  correction,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum TransactionAction {
  @JsonValue('Recharge')
  recharge,
  @JsonValue('Deduct')
  deduct,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum RiderRechargeTransactionType {
  @JsonValue('BankTransfer')
  bankTransfer,
  @JsonValue('Gift')
  gift,
  @JsonValue('Correction')
  correction,
  @JsonValue('InAppPayment')
  inAppPayment,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum PaymentGatewayType {
  @JsonValue('Stripe')
  stripe,
  @JsonValue('BrainTree')
  brainTree,
  @JsonValue('PayPal')
  payPal,
  @JsonValue('Paytm')
  paytm,
  @JsonValue('Razorpay')
  razorpay,
  @JsonValue('Paystack')
  paystack,
  @JsonValue('PayU')
  payU,
  @JsonValue('Instamojo')
  instamojo,
  @JsonValue('Flutterwave')
  flutterwave,
  @JsonValue('PayGate')
  payGate,
  @JsonValue('MIPS')
  mips,
  @JsonValue('MercadoPago')
  mercadoPago,
  @JsonValue('AmazonPaymentServices')
  amazonPaymentServices,
  @JsonValue('MyTMoney')
  myTMoney,
  @JsonValue('WayForPay')
  wayForPay,
  @JsonValue('CustomLink')
  customLink,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum TopUpWalletStatus {
  @JsonValue('OK')
  ok,
  @JsonValue('Redirect')
  redirect,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum CalculateFareError {
  @JsonValue('RegionUnsupported')
  regionUnsupported,
  @JsonValue('NoServiceInRegion')
  noServiceInRegion,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
final GET_MESSAGES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMessages'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'currentOrder'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'rider'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'ChatRider'), directives: [])
                  ])),
              FieldNode(
                  name: NameNode(value: 'driver'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'ChatDriver'), directives: [])
                  ])),
              FieldNode(
                  name: NameNode(value: 'conversations'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'sorting'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                              name: NameNode(value: 'field'),
                              value:
                                  EnumValueNode(name: NameNode(value: 'id'))),
                          ObjectFieldNode(
                              name: NameNode(value: 'direction'),
                              value:
                                  EnumValueNode(name: NameNode(value: 'DESC')))
                        ]))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'ChatMessage'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'ChatRider'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Rider'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'address'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'ChatDriver'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Driver'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'address'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'ChatMessage'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'OrderMessage'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'sentByDriver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class GetMessagesQuery
    extends GraphQLQuery<GetMessages$Query, JsonSerializable> {
  GetMessagesQuery();

  @override
  final DocumentNode document = GET_MESSAGES_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetMessages';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetMessages$Query parse(Map<String, dynamic> json) =>
      GetMessages$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SendMessageArguments extends JsonSerializable with EquatableMixin {
  SendMessageArguments({required this.requestId, required this.content});

  @override
  factory SendMessageArguments.fromJson(Map<String, dynamic> json) =>
      _$SendMessageArgumentsFromJson(json);

  late String requestId;

  late String content;

  @override
  List<Object?> get props => [requestId, content];
  @override
  Map<String, dynamic> toJson() => _$SendMessageArgumentsToJson(this);
}

final SEND_MESSAGE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SendMessage'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'requestId')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'content')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'createOneOrderMessage'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'orderMessage'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                              name: NameNode(value: 'requestId'),
                              value: VariableNode(
                                  name: NameNode(value: 'requestId'))),
                          ObjectFieldNode(
                              name: NameNode(value: 'content'),
                              value: VariableNode(
                                  name: NameNode(value: 'content')))
                        ]))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'ChatMessage'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'ChatMessage'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'OrderMessage'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'sentByDriver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class SendMessageMutation
    extends GraphQLQuery<SendMessage$Mutation, SendMessageArguments> {
  SendMessageMutation({required this.variables});

  @override
  final DocumentNode document = SEND_MESSAGE_MUTATION_DOCUMENT;

  @override
  final String operationName = 'SendMessage';

  @override
  final SendMessageArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SendMessage$Mutation parse(Map<String, dynamic> json) =>
      SendMessage$Mutation.fromJson(json);
}

final NEW_MESSAGE_RECEIVED_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'NewMessageReceived'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'newMessageReceived'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'ChatMessage'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'ChatMessage'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'OrderMessage'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'sentByDriver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class NewMessageReceivedSubscription
    extends GraphQLQuery<NewMessageReceived$Subscription, JsonSerializable> {
  NewMessageReceivedSubscription();

  @override
  final DocumentNode document = NEW_MESSAGE_RECEIVED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName = 'NewMessageReceived';

  @override
  List<Object?> get props => [document, operationName];
  @override
  NewMessageReceived$Subscription parse(Map<String, dynamic> json) =>
      NewMessageReceived$Subscription.fromJson(json);
}

final GET_ANNOUNCEMENTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetAnnouncements'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'announcements'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'paging'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'first'),
                        value: IntValueNode(value: '50'))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'title'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'startAt'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'description'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ]))
            ]))
      ]))
]);

class GetAnnouncementsQuery
    extends GraphQLQuery<GetAnnouncements$Query, JsonSerializable> {
  GetAnnouncementsQuery();

  @override
  final DocumentNode document = GET_ANNOUNCEMENTS_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetAnnouncements';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetAnnouncements$Query parse(Map<String, dynamic> json) =>
      GetAnnouncements$Query.fromJson(json);
}

final GET_RIDER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetRider'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'rider'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'), value: IntValueNode(value: '1'))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'mobileNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'gender'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class GetRiderQuery extends GraphQLQuery<GetRider$Query, JsonSerializable> {
  GetRiderQuery();

  @override
  final DocumentNode document = GET_RIDER_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetRider';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetRider$Query parse(Map<String, dynamic> json) =>
      GetRider$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileArguments extends JsonSerializable with EquatableMixin {
  UpdateProfileArguments(
      {required this.firstName,
      required this.lastName,
      this.gender,
      this.email});

  @override
  factory UpdateProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileArgumentsFromJson(json);

  late String firstName;

  late String lastName;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  final Gender? gender;

  final String? email;

  @override
  List<Object?> get props => [firstName, lastName, gender, email];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfileArgumentsToJson(this);
}

final UPDATE_PROFILE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateProfile'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'firstName')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'lastName')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'gender')),
            type: NamedTypeNode(
                name: NameNode(value: 'Gender'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'updateOneRider'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'id'),
                        value: StringValueNode(value: '1', isBlock: false)),
                    ObjectFieldNode(
                        name: NameNode(value: 'update'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                              name: NameNode(value: 'firstName'),
                              value: VariableNode(
                                  name: NameNode(value: 'firstName'))),
                          ObjectFieldNode(
                              name: NameNode(value: 'lastName'),
                              value: VariableNode(
                                  name: NameNode(value: 'lastName'))),
                          ObjectFieldNode(
                              name: NameNode(value: 'gender'),
                              value: VariableNode(
                                  name: NameNode(value: 'gender'))),
                          ObjectFieldNode(
                              name: NameNode(value: 'email'),
                              value:
                                  VariableNode(name: NameNode(value: 'email')))
                        ]))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class UpdateProfileMutation
    extends GraphQLQuery<UpdateProfile$Mutation, UpdateProfileArguments> {
  UpdateProfileMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_PROFILE_MUTATION_DOCUMENT;

  @override
  final String operationName = 'UpdateProfile';

  @override
  final UpdateProfileArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateProfile$Mutation parse(Map<String, dynamic> json) =>
      UpdateProfile$Mutation.fromJson(json);
}

final GET_ADDRESSES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetAddresses'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'riderAddresses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'details'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'location'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'lat'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'lng'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class GetAddressesQuery
    extends GraphQLQuery<GetAddresses$Query, JsonSerializable> {
  GetAddressesQuery();

  @override
  final DocumentNode document = GET_ADDRESSES_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetAddresses';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetAddresses$Query parse(Map<String, dynamic> json) =>
      GetAddresses$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateAddressArguments extends JsonSerializable with EquatableMixin {
  CreateAddressArguments(
      {required this.title,
      required this.details,
      required this.lat,
      required this.lng});

  @override
  factory CreateAddressArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressArgumentsFromJson(json);

  late String title;

  late String details;

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [title, details, lat, lng];
  @override
  Map<String, dynamic> toJson() => _$CreateAddressArgumentsToJson(this);
}

final CREATE_ADDRESS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateAddress'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'title')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'details')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'lat')),
            type:
                NamedTypeNode(name: NameNode(value: 'Float'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'lng')),
            type:
                NamedTypeNode(name: NameNode(value: 'Float'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'createOneRiderAddress'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'riderAddress'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                              name: NameNode(value: 'title'),
                              value:
                                  VariableNode(name: NameNode(value: 'title'))),
                          ObjectFieldNode(
                              name: NameNode(value: 'details'),
                              value: VariableNode(
                                  name: NameNode(value: 'details'))),
                          ObjectFieldNode(
                              name: NameNode(value: 'location'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                    name: NameNode(value: 'lat'),
                                    value: VariableNode(
                                        name: NameNode(value: 'lat'))),
                                ObjectFieldNode(
                                    name: NameNode(value: 'lng'),
                                    value: VariableNode(
                                        name: NameNode(value: 'lng')))
                              ]))
                        ]))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class CreateAddressMutation
    extends GraphQLQuery<CreateAddress$Mutation, CreateAddressArguments> {
  CreateAddressMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_ADDRESS_MUTATION_DOCUMENT;

  @override
  final String operationName = 'CreateAddress';

  @override
  final CreateAddressArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateAddress$Mutation parse(Map<String, dynamic> json) =>
      CreateAddress$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteAddressArguments extends JsonSerializable with EquatableMixin {
  DeleteAddressArguments({required this.id});

  @override
  factory DeleteAddressArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddressArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteAddressArgumentsToJson(this);
}

final DELETE_ADDRESS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteAddress'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'deleteOneRiderAddress'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'id'),
                        value: VariableNode(name: NameNode(value: 'id')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class DeleteAddressMutation
    extends GraphQLQuery<DeleteAddress$Mutation, DeleteAddressArguments> {
  DeleteAddressMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_ADDRESS_MUTATION_DOCUMENT;

  @override
  final String operationName = 'DeleteAddress';

  @override
  final DeleteAddressArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteAddress$Mutation parse(Map<String, dynamic> json) =>
      DeleteAddress$Mutation.fromJson(json);
}

final GET_HISTORY_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetHistory'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'orders'),
            alias: NameNode(value: 'completed'),
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'filter'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'status'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                              name: NameNode(value: 'eq'),
                              value: EnumValueNode(
                                  name: NameNode(value: 'Finished')))
                        ]))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'historyOrderItem'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'orders'),
            alias: NameNode(value: 'canceled'),
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'filter'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'status'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                              name: NameNode(value: 'eq'),
                              value: EnumValueNode(
                                  name: NameNode(value: 'RiderCanceled')))
                        ]))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'historyOrderItem'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'historyOrderItem'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'OrderConnection'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'node'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'status'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'createdOn'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'addresses'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'currency'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'costAfterCoupon'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'paymentGateway'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'title'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ])),
                    FieldNode(
                        name: NameNode(value: 'driver'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'firstName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'lastName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ])),
                    FieldNode(
                        name: NameNode(value: 'service'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'media'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'address'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ])),
                          FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ]))
            ])),
        FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'hasNextPage'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'endCursor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'startCursor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'hasPreviousPage'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetHistoryQuery extends GraphQLQuery<GetHistory$Query, JsonSerializable> {
  GetHistoryQuery();

  @override
  final DocumentNode document = GET_HISTORY_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetHistory';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetHistory$Query parse(Map<String, dynamic> json) =>
      GetHistory$Query.fromJson(json);
}

final WALLET_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Wallet'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'riderWallets'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'balance'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'currency'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'riderTransacions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'createdAt'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'amount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'currency'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'refrenceNumber'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'deductType'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'action'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'rechargeType'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ]))
            ]))
      ]))
]);

class WalletQuery extends GraphQLQuery<Wallet$Query, JsonSerializable> {
  WalletQuery();

  @override
  final DocumentNode document = WALLET_QUERY_DOCUMENT;

  @override
  final String operationName = 'Wallet';

  @override
  List<Object?> get props => [document, operationName];
  @override
  Wallet$Query parse(Map<String, dynamic> json) => Wallet$Query.fromJson(json);
}

final PAYMENT_GATEWAYS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'PaymentGateways'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'paymentGateways'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'publicKey'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class PaymentGatewaysQuery
    extends GraphQLQuery<PaymentGateways$Query, JsonSerializable> {
  PaymentGatewaysQuery();

  @override
  final DocumentNode document = PAYMENT_GATEWAYS_QUERY_DOCUMENT;

  @override
  final String operationName = 'PaymentGateways';

  @override
  List<Object?> get props => [document, operationName];
  @override
  PaymentGateways$Query parse(Map<String, dynamic> json) =>
      PaymentGateways$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class TopUpWalletArguments extends JsonSerializable with EquatableMixin {
  TopUpWalletArguments({required this.input});

  @override
  factory TopUpWalletArguments.fromJson(Map<String, dynamic> json) =>
      _$TopUpWalletArgumentsFromJson(json);

  late TopUpWalletInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$TopUpWalletArgumentsToJson(this);
}

final TOP_UP_WALLET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'TopUpWallet'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'input')),
            type: NamedTypeNode(
                name: NameNode(value: 'TopUpWalletInput'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'topUpWallet'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: VariableNode(name: NameNode(value: 'input')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'url'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class TopUpWalletMutation
    extends GraphQLQuery<TopUpWallet$Mutation, TopUpWalletArguments> {
  TopUpWalletMutation({required this.variables});

  @override
  final DocumentNode document = TOP_UP_WALLET_MUTATION_DOCUMENT;

  @override
  final String operationName = 'TopUpWallet';

  @override
  final TopUpWalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  TopUpWallet$Mutation parse(Map<String, dynamic> json) =>
      TopUpWallet$Mutation.fromJson(json);
}

final GET_CURRENT_ORDER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCurrentOrder'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'currentOrderWithLocation'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'order'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'CurrentOrder'), directives: [])
                  ])),
              FieldNode(
                  name: NameNode(value: 'driverLocation'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'Point'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'CurrentOrder'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Order'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'points'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'Point'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'mobileNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'carPlate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'car'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'carColor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'rating'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'etaPickup'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'paidAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costAfterCoupon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costBest'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'addresses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'Point'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Point'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'lat'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lng'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class GetCurrentOrderQuery
    extends GraphQLQuery<GetCurrentOrder$Query, JsonSerializable> {
  GetCurrentOrderQuery();

  @override
  final DocumentNode document = GET_CURRENT_ORDER_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetCurrentOrder';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetCurrentOrder$Query parse(Map<String, dynamic> json) =>
      GetCurrentOrder$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CalculateFareArguments extends JsonSerializable with EquatableMixin {
  CalculateFareArguments({required this.points});

  @override
  factory CalculateFareArguments.fromJson(Map<String, dynamic> json) =>
      _$CalculateFareArgumentsFromJson(json);

  late List<PointInput> points;

  @override
  List<Object?> get props => [points];
  @override
  Map<String, dynamic> toJson() => _$CalculateFareArgumentsToJson(this);
}

final CALCULATE_FARE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CalculateFare'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'points')),
            type: ListTypeNode(
                type: NamedTypeNode(
                    name: NameNode(value: 'PointInput'), isNonNull: true),
                isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'calculateFare'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'points'),
                        value: VariableNode(name: NameNode(value: 'points')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'distance'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'duration'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'currency'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'services'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'services'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'media'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'address'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ])),
                          FieldNode(
                              name: NameNode(value: 'cost'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ])),
              FieldNode(
                  name: NameNode(value: 'error'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class CalculateFareMutation
    extends GraphQLQuery<CalculateFare$Mutation, CalculateFareArguments> {
  CalculateFareMutation({required this.variables});

  @override
  final DocumentNode document = CALCULATE_FARE_MUTATION_DOCUMENT;

  @override
  final String operationName = 'CalculateFare';

  @override
  final CalculateFareArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CalculateFare$Mutation parse(Map<String, dynamic> json) =>
      CalculateFare$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderArguments extends JsonSerializable with EquatableMixin {
  CreateOrderArguments({required this.input});

  @override
  factory CreateOrderArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderArgumentsFromJson(json);

  late CreateOrderInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$CreateOrderArgumentsToJson(this);
}

final CREATE_ORDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'input')),
            type: NamedTypeNode(
                name: NameNode(value: 'CreateOrderInput'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'createOrder'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: VariableNode(name: NameNode(value: 'input')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'CurrentOrder'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'CurrentOrder'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Order'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'points'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'Point'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'mobileNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'carPlate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'car'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'carColor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'rating'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'etaPickup'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'paidAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costAfterCoupon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costBest'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'addresses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'Point'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Point'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'lat'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lng'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class CreateOrderMutation
    extends GraphQLQuery<CreateOrder$Mutation, CreateOrderArguments> {
  CreateOrderMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_ORDER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'CreateOrder';

  @override
  final CreateOrderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateOrder$Mutation parse(Map<String, dynamic> json) =>
      CreateOrder$Mutation.fromJson(json);
}

final CANCEL_ORDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CancelOrder'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'cancelOrder'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'CurrentOrder'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'CurrentOrder'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Order'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'points'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'Point'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'mobileNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'carPlate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'car'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'carColor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'rating'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'etaPickup'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'paidAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costAfterCoupon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costBest'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'addresses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'Point'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Point'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'lat'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lng'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class CancelOrderMutation
    extends GraphQLQuery<CancelOrder$Mutation, JsonSerializable> {
  CancelOrderMutation();

  @override
  final DocumentNode document = CANCEL_ORDER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'CancelOrder';

  @override
  List<Object?> get props => [document, operationName];
  @override
  CancelOrder$Mutation parse(Map<String, dynamic> json) =>
      CancelOrder$Mutation.fromJson(json);
}

final UPDATED_ORDER_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'UpdatedOrder'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'orderUpdated'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'points'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'lat'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'lng'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'driver'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'firstName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'lastName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'media'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'address'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ])),
                    FieldNode(
                        name: NameNode(value: 'mobileNumber'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'carPlate'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'car'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ])),
                    FieldNode(
                        name: NameNode(value: 'carColor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ])),
                    FieldNode(
                        name: NameNode(value: 'rating'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'service'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'media'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'address'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ])),
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'etaPickup'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'paidAmount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'costAfterCoupon'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'costBest'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'currency'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'addresses'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class UpdatedOrderSubscription
    extends GraphQLQuery<UpdatedOrder$Subscription, JsonSerializable> {
  UpdatedOrderSubscription();

  @override
  final DocumentNode document = UPDATED_ORDER_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName = 'UpdatedOrder';

  @override
  List<Object?> get props => [document, operationName];
  @override
  UpdatedOrder$Subscription parse(Map<String, dynamic> json) =>
      UpdatedOrder$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdatedArguments extends JsonSerializable
    with EquatableMixin {
  DriverLocationUpdatedArguments({required this.driverId});

  @override
  factory DriverLocationUpdatedArguments.fromJson(Map<String, dynamic> json) =>
      _$DriverLocationUpdatedArgumentsFromJson(json);

  late String driverId;

  @override
  List<Object?> get props => [driverId];
  @override
  Map<String, dynamic> toJson() => _$DriverLocationUpdatedArgumentsToJson(this);
}

final DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'DriverLocationUpdated'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'driverId')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'driverLocationUpdated'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'driverId'),
                  value: VariableNode(name: NameNode(value: 'driverId')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'Point'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'Point'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Point'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'lat'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lng'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class DriverLocationUpdatedSubscription extends GraphQLQuery<
    DriverLocationUpdated$Subscription, DriverLocationUpdatedArguments> {
  DriverLocationUpdatedSubscription({required this.variables});

  @override
  final DocumentNode document = DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName = 'DriverLocationUpdated';

  @override
  final DriverLocationUpdatedArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DriverLocationUpdated$Subscription parse(Map<String, dynamic> json) =>
      DriverLocationUpdated$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedbackArguments extends JsonSerializable with EquatableMixin {
  SubmitFeedbackArguments(
      {required this.score, required this.description, required this.orderId});

  @override
  factory SubmitFeedbackArguments.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedbackArgumentsFromJson(json);

  late int score;

  late String description;

  late String orderId;

  @override
  List<Object?> get props => [score, description, orderId];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedbackArgumentsToJson(this);
}

final SUBMIT_FEEDBACK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SubmitFeedback'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'score')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'description')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'orderId')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'submitReview'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'review'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'score'),
                        value: VariableNode(name: NameNode(value: 'score'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'description'),
                        value:
                            VariableNode(name: NameNode(value: 'description'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'requestId'),
                        value: VariableNode(name: NameNode(value: 'orderId')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'CurrentOrder'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'CurrentOrder'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Order'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'points'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'Point'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'mobileNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'carPlate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'car'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'carColor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'rating'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'etaPickup'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'paidAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costAfterCoupon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costBest'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'addresses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'Point'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Point'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'lat'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lng'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class SubmitFeedbackMutation
    extends GraphQLQuery<SubmitFeedback$Mutation, SubmitFeedbackArguments> {
  SubmitFeedbackMutation({required this.variables});

  @override
  final DocumentNode document = SUBMIT_FEEDBACK_MUTATION_DOCUMENT;

  @override
  final String operationName = 'SubmitFeedback';

  @override
  final SubmitFeedbackArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SubmitFeedback$Mutation parse(Map<String, dynamic> json) =>
      SubmitFeedback$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocationArguments extends JsonSerializable with EquatableMixin {
  GetDriversLocationArguments({this.point});

  @override
  factory GetDriversLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocationArgumentsFromJson(json);

  final PointInput? point;

  @override
  List<Object?> get props => [point];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocationArgumentsToJson(this);
}

final GET_DRIVERS_LOCATION_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetDriversLocation'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'point')),
            type: NamedTypeNode(
                name: NameNode(value: 'PointInput'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'getDriversLocation'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'center'),
                  value: VariableNode(name: NameNode(value: 'point')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'lat'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lng'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetDriversLocationQuery extends GraphQLQuery<GetDriversLocation$Query,
    GetDriversLocationArguments> {
  GetDriversLocationQuery({required this.variables});

  @override
  final DocumentNode document = GET_DRIVERS_LOCATION_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetDriversLocation';

  @override
  final GetDriversLocationArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetDriversLocation$Query parse(Map<String, dynamic> json) =>
      GetDriversLocation$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ApplyCouponArguments extends JsonSerializable with EquatableMixin {
  ApplyCouponArguments({required this.code});

  @override
  factory ApplyCouponArguments.fromJson(Map<String, dynamic> json) =>
      _$ApplyCouponArgumentsFromJson(json);

  late String code;

  @override
  List<Object?> get props => [code];
  @override
  Map<String, dynamic> toJson() => _$ApplyCouponArgumentsToJson(this);
}

final APPLY_COUPON_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ApplyCoupon'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'code')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'applyCoupon'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'code'),
                  value: VariableNode(name: NameNode(value: 'code')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'CurrentOrder'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'CurrentOrder'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Order'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'points'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'Point'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'mobileNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'carPlate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'car'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'carColor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'rating'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'media'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'etaPickup'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'paidAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costAfterCoupon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'costBest'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'addresses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'Point'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Point'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'lat'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lng'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class ApplyCouponMutation
    extends GraphQLQuery<ApplyCoupon$Mutation, ApplyCouponArguments> {
  ApplyCouponMutation({required this.variables});

  @override
  final DocumentNode document = APPLY_COUPON_MUTATION_DOCUMENT;

  @override
  final String operationName = 'ApplyCoupon';

  @override
  final ApplyCouponArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ApplyCoupon$Mutation parse(Map<String, dynamic> json) =>
      ApplyCoupon$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class LoginArguments extends JsonSerializable with EquatableMixin {
  LoginArguments({required this.firebaseToken});

  @override
  factory LoginArguments.fromJson(Map<String, dynamic> json) =>
      _$LoginArgumentsFromJson(json);

  late String firebaseToken;

  @override
  List<Object?> get props => [firebaseToken];
  @override
  Map<String, dynamic> toJson() => _$LoginArgumentsToJson(this);
}

final LOGIN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Login'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'firebaseToken')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'login'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'firebaseToken'),
                        value: VariableNode(
                            name: NameNode(value: 'firebaseToken')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'jwtToken'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class LoginMutation extends GraphQLQuery<Login$Mutation, LoginArguments> {
  LoginMutation({required this.variables});

  @override
  final DocumentNode document = LOGIN_MUTATION_DOCUMENT;

  @override
  final String operationName = 'Login';

  @override
  final LoginArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Login$Mutation parse(Map<String, dynamic> json) =>
      Login$Mutation.fromJson(json);
}
