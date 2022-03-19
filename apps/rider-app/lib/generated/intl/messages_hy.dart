// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hy locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hy';

  static String m0(hour, minute) => "Ամրագրեք ${hour}-ի համար՝${minute}";

  static String m1(count) => "& ${count} այլ արժույթներ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "action_apply": MessageLookupByLibrary.simpleMessage("Դիմել"),
        "action_cancel": MessageLookupByLibrary.simpleMessage("Չեղարկել"),
        "action_delete": MessageLookupByLibrary.simpleMessage("Ջնջել"),
        "action_next": MessageLookupByLibrary.simpleMessage("Հաջորդը"),
        "action_save": MessageLookupByLibrary.simpleMessage("Պահպանել"),
        "addresses_empty_state_message":
            MessageLookupByLibrary.simpleMessage("Նշելով այստեղ տեսնել:"),
        "announcements_empty_state_message":
            MessageLookupByLibrary.simpleMessage("Այստեղ տեսնելու ոչինչ չկա:"),
        "app_name": MessageLookupByLibrary.simpleMessage("Ռիդին"),
        "copyright_notice": MessageLookupByLibrary.simpleMessage(
            "Հեղինակային իրավունք © ridy.io, Լավ վերապահված է:"),
        "coupon_heading": MessageLookupByLibrary.simpleMessage(
            "Մուտքագրեք ստորև բերված կտրոնի կոդը."),
        "coupon_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Կտրոնի կոդը"),
        "create_address_details_empty_error":
            MessageLookupByLibrary.simpleMessage(
                "Խնդրում ենք մուտքագրել հասցեի մանրամասները"),
        "create_address_details_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Մանրամասներ"),
        "create_address_name_empty_error": MessageLookupByLibrary.simpleMessage(
            "Խնդրում ենք մուտքագրել գտնվելու վայրի անունը"),
        "create_address_title_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Կոչում"),
        "driver_info_card_call":
            MessageLookupByLibrary.simpleMessage("Զանգահարեք"),
        "driver_info_card_message":
            MessageLookupByLibrary.simpleMessage("Հաղորդագրություն"),
        "enum_address_type_home": MessageLookupByLibrary.simpleMessage("Home"),
        "enum_address_type_other":
            MessageLookupByLibrary.simpleMessage("Other"),
        "enum_address_type_partner":
            MessageLookupByLibrary.simpleMessage("Partner"),
        "enum_address_type_work": MessageLookupByLibrary.simpleMessage("Work"),
        "enum_gender_female": MessageLookupByLibrary.simpleMessage("իգական"),
        "enum_gender_male": MessageLookupByLibrary.simpleMessage("Արական"),
        "enum_gender_unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "enum_rider_transaction_deduct_correction":
            MessageLookupByLibrary.simpleMessage("Ուղղում"),
        "enum_rider_transaction_deduct_order_fee":
            MessageLookupByLibrary.simpleMessage("Պատվիրեք անվճար"),
        "enum_rider_transaction_deduct_withdraw":
            MessageLookupByLibrary.simpleMessage("հանել"),
        "enum_rider_transaction_recharge_bank_transfer":
            MessageLookupByLibrary.simpleMessage("Բանկային փոխանցում"),
        "enum_rider_transaction_recharge_correction":
            MessageLookupByLibrary.simpleMessage("Ուղղում"),
        "enum_rider_transaction_recharge_gift":
            MessageLookupByLibrary.simpleMessage("Նվեր"),
        "enum_rider_transaction_recharge_in_app_payment":
            MessageLookupByLibrary.simpleMessage("Ներծրագրի վճարում"),
        "enum_unknown": MessageLookupByLibrary.simpleMessage("Անհայտ"),
        "history_payment_method_cash":
            MessageLookupByLibrary.simpleMessage("Կանխիկ"),
        "invoice_apply_coupon_action":
            MessageLookupByLibrary.simpleMessage("Կիրառեք կտրոնը"),
        "invoice_coupon_discount":
            MessageLookupByLibrary.simpleMessage("Կտրոնային զեղչ"),
        "invoice_pay_online_action":
            MessageLookupByLibrary.simpleMessage("Վճարեք առցանց"),
        "invoice_service_fee":
            MessageLookupByLibrary.simpleMessage("Ծառայության վճար"),
        "invoice_subtotal": MessageLookupByLibrary.simpleMessage("Ենթագումար"),
        "loading": MessageLookupByLibrary.simpleMessage("Բեռնվում է"),
        "login_cell_number_empty_error": MessageLookupByLibrary.simpleMessage(
            "Խնդրում ենք մուտքագրել հեռախոսահամարը ճիշտ ձևաչափով"),
        "login_cell_number_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Հեռախոսի համար"),
        "login_heading_first_line":
            MessageLookupByLibrary.simpleMessage("Մուտքագրեք ձեր"),
        "login_heading_second_line":
            MessageLookupByLibrary.simpleMessage("բջջայինի համար"),
        "login_heading_third_line": MessageLookupByLibrary.simpleMessage(
            "Մենք ձեզ կուղարկենք հաստատման կոդը"),
        "looking_cancel_request":
            MessageLookupByLibrary.simpleMessage("Չեղարկել հարցումը"),
        "looking_heading": MessageLookupByLibrary.simpleMessage(
            "Ուղևորություն եմ փնտրում, խնդրում ենք սպասել..."),
        "menu_about": MessageLookupByLibrary.simpleMessage("Մասին"),
        "menu_announcements":
            MessageLookupByLibrary.simpleMessage("Հայտարարություններ"),
        "menu_chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "menu_login": MessageLookupByLibrary.simpleMessage("Մուտք գործել"),
        "menu_logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "menu_profile": MessageLookupByLibrary.simpleMessage("Անձնագիր"),
        "menu_saved_locations":
            MessageLookupByLibrary.simpleMessage("Պահված վայրեր"),
        "menu_trip_history":
            MessageLookupByLibrary.simpleMessage("Ուղևորության պատմություն"),
        "menu_wallet": MessageLookupByLibrary.simpleMessage("Դրամապանակ"),
        "place_search_hint": MessageLookupByLibrary.simpleMessage(
            "Մուտքագրեք տեղանքի հիմնաբառերը"),
        "point_selection_add_destination":
            MessageLookupByLibrary.simpleMessage("Add Destination"),
        "point_selection_confirm_pickup": MessageLookupByLibrary.simpleMessage(
            "Հաստատեք Վերցնելու տեղադրությունը"),
        "point_selection_final_destination":
            MessageLookupByLibrary.simpleMessage("Final Destination"),
        "profile_email": MessageLookupByLibrary.simpleMessage("Էլ"),
        "profile_firstname": MessageLookupByLibrary.simpleMessage("Անուն"),
        "profile_gender": MessageLookupByLibrary.simpleMessage("Սեռ"),
        "profile_lastname": MessageLookupByLibrary.simpleMessage("Ազգանուն"),
        "profile_mobilenumber":
            MessageLookupByLibrary.simpleMessage("Բջջայինի համար"),
        "review_action_submit_review":
            MessageLookupByLibrary.simpleMessage("Ներկայացրեք վերանայում"),
        "review_text_heading": MessageLookupByLibrary.simpleMessage(
            "Ինչպե՞ս կգնահատեք ձեր փորձը:"),
        "review_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Ավելացնել մեկնաբանություն"),
        "service_selection_book_later": m0,
        "service_selection_book_now":
            MessageLookupByLibrary.simpleMessage("Ամրագրեք հիմա"),
        "top_up_sheet_pay_button":
            MessageLookupByLibrary.simpleMessage("Վճարել"),
        "top_up_sheet_textfield_hint": MessageLookupByLibrary.simpleMessage(
            "Վերալիցքավորման համար մուտքագրված գումարը"),
        "trip_history_canceled_tab":
            MessageLookupByLibrary.simpleMessage("Չեղարկված է"),
        "trip_history_completed_tab":
            MessageLookupByLibrary.simpleMessage("Ավարտված է"),
        "trip_history_empty_state_message":
            MessageLookupByLibrary.simpleMessage("Նախկին պատվեր չի գրանցվել:"),
        "verify_phone_code_empty_message": MessageLookupByLibrary.simpleMessage(
            "Ստուգման կոդը մուտքագրված չէ:"),
        "verify_phone_heading_first_line":
            MessageLookupByLibrary.simpleMessage("Մուտքագրեք ուղարկված կոդը"),
        "verify_phone_heading_second_line":
            MessageLookupByLibrary.simpleMessage("ձեր հեռախոսին"),
        "verify_phone_heading_third_line": MessageLookupByLibrary.simpleMessage(
            "Մենք ձեզ կուղարկենք հաստատման կոդը"),
        "wallet_activities_heading":
            MessageLookupByLibrary.simpleMessage("Activities"),
        "wallet_add_credit":
            MessageLookupByLibrary.simpleMessage("Ավելացնել վարկ"),
        "wallet_empty_state_message":
            MessageLookupByLibrary.simpleMessage("Պատմություն չի գրանցվել:"),
        "wallet_gateway_empty_state":
            MessageLookupByLibrary.simpleMessage("Դարպաս չկա:"),
        "wallet_other_currencies_available": m1,
        "wallet_select_currency":
            MessageLookupByLibrary.simpleMessage("Ընտրեք արժույթ."),
        "wallet_select_payment_method":
            MessageLookupByLibrary.simpleMessage("Ընտրեք վճարման եղանակը."),
        "wallet_switch_currency":
            MessageLookupByLibrary.simpleMessage("Անջատիչ")
      };
}
