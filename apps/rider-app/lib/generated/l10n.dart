// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ridy`
  String get app_name {
    return Intl.message(
      'Ridy',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No Gateway is available.`
  String get wallet_gateway_empty_state {
    return Intl.message(
      'No Gateway is available.',
      name: 'wallet_gateway_empty_state',
      desc: '',
      args: [],
    );
  }

  /// `& {count} other currencies`
  String wallet_other_currencies_available(Object count) {
    return Intl.message(
      '& $count other currencies',
      name: 'wallet_other_currencies_available',
      desc: '',
      args: [count],
    );
  }

  /// `Switch`
  String get wallet_switch_currency {
    return Intl.message(
      'Switch',
      name: 'wallet_switch_currency',
      desc: '',
      args: [],
    );
  }

  /// `No history recorded.`
  String get wallet_empty_state_message {
    return Intl.message(
      'No history recorded.',
      name: 'wallet_empty_state_message',
      desc: '',
      args: [],
    );
  }

  /// `Add Credit`
  String get wallet_add_credit {
    return Intl.message(
      'Add Credit',
      name: 'wallet_add_credit',
      desc: '',
      args: [],
    );
  }

  /// `Order Free`
  String get enum_rider_transaction_deduct_order_fee {
    return Intl.message(
      'Order Free',
      name: 'enum_rider_transaction_deduct_order_fee',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get enum_rider_transaction_deduct_withdraw {
    return Intl.message(
      'Withdraw',
      name: 'enum_rider_transaction_deduct_withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Correction`
  String get enum_rider_transaction_deduct_correction {
    return Intl.message(
      'Correction',
      name: 'enum_rider_transaction_deduct_correction',
      desc: '',
      args: [],
    );
  }

  /// `Unkonwn`
  String get enum_unknown {
    return Intl.message(
      'Unkonwn',
      name: 'enum_unknown',
      desc: '',
      args: [],
    );
  }

  /// `In-app Payment`
  String get enum_rider_transaction_recharge_in_app_payment {
    return Intl.message(
      'In-app Payment',
      name: 'enum_rider_transaction_recharge_in_app_payment',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get enum_rider_transaction_recharge_gift {
    return Intl.message(
      'Gift',
      name: 'enum_rider_transaction_recharge_gift',
      desc: '',
      args: [],
    );
  }

  /// `Correction`
  String get enum_rider_transaction_recharge_correction {
    return Intl.message(
      'Correction',
      name: 'enum_rider_transaction_recharge_correction',
      desc: '',
      args: [],
    );
  }

  /// `Bank Transfer`
  String get enum_rider_transaction_recharge_bank_transfer {
    return Intl.message(
      'Bank Transfer',
      name: 'enum_rider_transaction_recharge_bank_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Select currency:`
  String get wallet_select_currency {
    return Intl.message(
      'Select currency:',
      name: 'wallet_select_currency',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method:`
  String get wallet_select_payment_method {
    return Intl.message(
      'Select Payment Method:',
      name: 'wallet_select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Input amount to recharge`
  String get top_up_sheet_textfield_hint {
    return Intl.message(
      'Input amount to recharge',
      name: 'top_up_sheet_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get top_up_sheet_pay_button {
    return Intl.message(
      'Pay',
      name: 'top_up_sheet_pay_button',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Pickup Location`
  String get point_selection_confirm_pickup {
    return Intl.message(
      'Confirm Pickup Location',
      name: 'point_selection_confirm_pickup',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get service_selection_book_now {
    return Intl.message(
      'Book Now',
      name: 'service_selection_book_now',
      desc: '',
      args: [],
    );
  }

  /// `Book for {hour}:{minute}`
  String service_selection_book_later(Object hour, Object minute) {
    return Intl.message(
      'Book for $hour:$minute',
      name: 'service_selection_book_later',
      desc: '',
      args: [hour, minute],
    );
  }

  /// `Cancel`
  String get action_cancel {
    return Intl.message(
      'Cancel',
      name: 'action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Enter keywords of the location`
  String get place_search_hint {
    return Intl.message(
      'Enter keywords of the location',
      name: 'place_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get review_action_submit_review {
    return Intl.message(
      'Submit Review',
      name: 'review_action_submit_review',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment`
  String get review_textfield_hint {
    return Intl.message(
      'Add Comment',
      name: 'review_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate your experience?`
  String get review_text_heading {
    return Intl.message(
      'How would you rate your experience?',
      name: 'review_text_heading',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get invoice_subtotal {
    return Intl.message(
      'Subtotal',
      name: 'invoice_subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Coupon discount`
  String get invoice_coupon_discount {
    return Intl.message(
      'Coupon discount',
      name: 'invoice_coupon_discount',
      desc: '',
      args: [],
    );
  }

  /// `Service Fee`
  String get invoice_service_fee {
    return Intl.message(
      'Service Fee',
      name: 'invoice_service_fee',
      desc: '',
      args: [],
    );
  }

  /// `Apply Coupon`
  String get invoice_apply_coupon_action {
    return Intl.message(
      'Apply Coupon',
      name: 'invoice_apply_coupon_action',
      desc: '',
      args: [],
    );
  }

  /// `Pay Online`
  String get invoice_pay_online_action {
    return Intl.message(
      'Pay Online',
      name: 'invoice_pay_online_action',
      desc: '',
      args: [],
    );
  }

  /// `Looking for ride, please wait...`
  String get looking_heading {
    return Intl.message(
      'Looking for ride, please wait...',
      name: 'looking_heading',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Request`
  String get looking_cancel_request {
    return Intl.message(
      'Cancel Request',
      name: 'looking_cancel_request',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get driver_info_card_message {
    return Intl.message(
      'Message',
      name: 'driver_info_card_message',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get driver_info_card_call {
    return Intl.message(
      'Call',
      name: 'driver_info_card_call',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © ridy.io, Alright reserved.`
  String get copyright_notice {
    return Intl.message(
      'Copyright © ridy.io, Alright reserved.',
      name: 'copyright_notice',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get menu_about {
    return Intl.message(
      'About',
      name: 'menu_about',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get menu_login {
    return Intl.message(
      'Login',
      name: 'menu_login',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get menu_profile {
    return Intl.message(
      'Profile',
      name: 'menu_profile',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get menu_wallet {
    return Intl.message(
      'Wallet',
      name: 'menu_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Trip History`
  String get menu_trip_history {
    return Intl.message(
      'Trip History',
      name: 'menu_trip_history',
      desc: '',
      args: [],
    );
  }

  /// `Announcements`
  String get menu_announcements {
    return Intl.message(
      'Announcements',
      name: 'menu_announcements',
      desc: '',
      args: [],
    );
  }

  /// `Saved Locations`
  String get menu_saved_locations {
    return Intl.message(
      'Saved Locations',
      name: 'menu_saved_locations',
      desc: '',
      args: [],
    );
  }

  /// `Enter the coupon code below:`
  String get coupon_heading {
    return Intl.message(
      'Enter the coupon code below:',
      name: 'coupon_heading',
      desc: '',
      args: [],
    );
  }

  /// `Coupon code`
  String get coupon_textfield_hint {
    return Intl.message(
      'Coupon code',
      name: 'coupon_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get action_apply {
    return Intl.message(
      'Apply',
      name: 'action_apply',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get action_save {
    return Intl.message(
      'Save',
      name: 'action_save',
      desc: '',
      args: [],
    );
  }

  /// `Please enter name of location`
  String get create_address_name_empty_error {
    return Intl.message(
      'Please enter name of location',
      name: 'create_address_name_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter details about the address`
  String get create_address_details_empty_error {
    return Intl.message(
      'Please enter details about the address',
      name: 'create_address_details_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get create_address_details_textfield_hint {
    return Intl.message(
      'Details',
      name: 'create_address_details_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get create_address_title_textfield_hint {
    return Intl.message(
      'Title',
      name: 'create_address_title_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get action_delete {
    return Intl.message(
      'Delete',
      name: 'action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Noting To See Here.`
  String get addresses_empty_state_message {
    return Intl.message(
      'Noting To See Here.',
      name: 'addresses_empty_state_message',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to see here.`
  String get announcements_empty_state_message {
    return Intl.message(
      'Nothing to see here.',
      name: 'announcements_empty_state_message',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get history_payment_method_cash {
    return Intl.message(
      'Cash',
      name: 'history_payment_method_cash',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get trip_history_completed_tab {
    return Intl.message(
      'Completed',
      name: 'trip_history_completed_tab',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get trip_history_canceled_tab {
    return Intl.message(
      'Canceled',
      name: 'trip_history_canceled_tab',
      desc: '',
      args: [],
    );
  }

  /// `No past order has been recorded.`
  String get trip_history_empty_state_message {
    return Intl.message(
      'No past order has been recorded.',
      name: 'trip_history_empty_state_message',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get profile_mobilenumber {
    return Intl.message(
      'Mobile Number',
      name: 'profile_mobilenumber',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get profile_firstname {
    return Intl.message(
      'First Name',
      name: 'profile_firstname',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get profile_lastname {
    return Intl.message(
      'Last Name',
      name: 'profile_lastname',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get profile_email {
    return Intl.message(
      'E-Mail',
      name: 'profile_email',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get profile_gender {
    return Intl.message(
      'Gender',
      name: 'profile_gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get enum_gender_male {
    return Intl.message(
      'Male',
      name: 'enum_gender_male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get enum_gender_female {
    return Intl.message(
      'Female',
      name: 'enum_gender_female',
      desc: '',
      args: [],
    );
  }

  /// `Enter your`
  String get login_heading_first_line {
    return Intl.message(
      'Enter your',
      name: 'login_heading_first_line',
      desc: '',
      args: [],
    );
  }

  /// `mobile number`
  String get login_heading_second_line {
    return Intl.message(
      'mobile number',
      name: 'login_heading_second_line',
      desc: '',
      args: [],
    );
  }

  /// `We will send you confirmation code`
  String get login_heading_third_line {
    return Intl.message(
      'We will send you confirmation code',
      name: 'login_heading_third_line',
      desc: '',
      args: [],
    );
  }

  /// `Cell Number`
  String get login_cell_number_textfield_hint {
    return Intl.message(
      'Cell Number',
      name: 'login_cell_number_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone number in correct format`
  String get login_cell_number_empty_error {
    return Intl.message(
      'Please enter the phone number in correct format',
      name: 'login_cell_number_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get action_next {
    return Intl.message(
      'Next',
      name: 'action_next',
      desc: '',
      args: [],
    );
  }

  /// `Enter code sent`
  String get verify_phone_heading_first_line {
    return Intl.message(
      'Enter code sent',
      name: 'verify_phone_heading_first_line',
      desc: '',
      args: [],
    );
  }

  /// `to your phone`
  String get verify_phone_heading_second_line {
    return Intl.message(
      'to your phone',
      name: 'verify_phone_heading_second_line',
      desc: '',
      args: [],
    );
  }

  /// `We will send you the confirmation code`
  String get verify_phone_heading_third_line {
    return Intl.message(
      'We will send you the confirmation code',
      name: 'verify_phone_heading_third_line',
      desc: '',
      args: [],
    );
  }

  /// `Verification code is not entered.`
  String get verify_phone_code_empty_message {
    return Intl.message(
      'Verification code is not entered.',
      name: 'verify_phone_code_empty_message',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get wallet_activities_heading {
    return Intl.message(
      'Activities',
      name: 'wallet_activities_heading',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get menu_logout {
    return Intl.message(
      'Logout',
      name: 'menu_logout',
      desc: '',
      args: [],
    );
  }

  /// `Final Destination`
  String get point_selection_final_destination {
    return Intl.message(
      'Final Destination',
      name: 'point_selection_final_destination',
      desc: '',
      args: [],
    );
  }

  /// `Add Destination`
  String get point_selection_add_destination {
    return Intl.message(
      'Add Destination',
      name: 'point_selection_add_destination',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get menu_chat {
    return Intl.message(
      'Chat',
      name: 'menu_chat',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get enum_gender_unknown {
    return Intl.message(
      'Unknown',
      name: 'enum_gender_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get enum_address_type_home {
    return Intl.message(
      'Home',
      name: 'enum_address_type_home',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get enum_address_type_work {
    return Intl.message(
      'Work',
      name: 'enum_address_type_work',
      desc: '',
      args: [],
    );
  }

  /// `Partner`
  String get enum_address_type_partner {
    return Intl.message(
      'Partner',
      name: 'enum_address_type_partner',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get enum_address_type_other {
    return Intl.message(
      'Other',
      name: 'enum_address_type_other',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fa'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'hy'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'ur'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
