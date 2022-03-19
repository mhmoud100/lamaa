// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(hour, minute) => "حجز لـ ${hour}: ${minute}";

  static String m1(count) => "& ${count} عملات أخرى";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "action_apply": MessageLookupByLibrary.simpleMessage("تطبيق"),
        "action_cancel": MessageLookupByLibrary.simpleMessage("يلغي"),
        "action_delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "action_next": MessageLookupByLibrary.simpleMessage("التالي"),
        "action_save": MessageLookupByLibrary.simpleMessage("يحفظ"),
        "addresses_empty_state_message":
            MessageLookupByLibrary.simpleMessage("مع ملاحظة أن نرى هنا."),
        "announcements_empty_state_message":
            MessageLookupByLibrary.simpleMessage("لا شيء لتراه هنا."),
        "app_name": MessageLookupByLibrary.simpleMessage("ريدي"),
        "copyright_notice": MessageLookupByLibrary.simpleMessage(
            "حقوق الطبع والنشر © ridy.io ، حقًا محفوظة."),
        "coupon_heading":
            MessageLookupByLibrary.simpleMessage("أدخل رمز القسيمة أدناه:"),
        "coupon_textfield_hint":
            MessageLookupByLibrary.simpleMessage("رمز الكوبون"),
        "create_address_details_empty_error":
            MessageLookupByLibrary.simpleMessage(
                "الرجاء إدخال تفاصيل حول العنوان"),
        "create_address_details_textfield_hint":
            MessageLookupByLibrary.simpleMessage("تفاصيل"),
        "create_address_name_empty_error":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال اسم الموقع"),
        "create_address_title_textfield_hint":
            MessageLookupByLibrary.simpleMessage("عنوان"),
        "driver_info_card_call": MessageLookupByLibrary.simpleMessage("مكالمة"),
        "driver_info_card_message":
            MessageLookupByLibrary.simpleMessage("رسالة"),
        "enum_address_type_home": MessageLookupByLibrary.simpleMessage("Home"),
        "enum_address_type_other":
            MessageLookupByLibrary.simpleMessage("Other"),
        "enum_address_type_partner":
            MessageLookupByLibrary.simpleMessage("Partner"),
        "enum_address_type_work": MessageLookupByLibrary.simpleMessage("Work"),
        "enum_gender_female": MessageLookupByLibrary.simpleMessage("أنثى"),
        "enum_gender_male": MessageLookupByLibrary.simpleMessage("ذكر"),
        "enum_gender_unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "enum_rider_transaction_deduct_correction":
            MessageLookupByLibrary.simpleMessage("تصحيح"),
        "enum_rider_transaction_deduct_order_fee":
            MessageLookupByLibrary.simpleMessage("اطلب مجانا"),
        "enum_rider_transaction_deduct_withdraw":
            MessageLookupByLibrary.simpleMessage("ينسحب"),
        "enum_rider_transaction_recharge_bank_transfer":
            MessageLookupByLibrary.simpleMessage("حوالة بنكية"),
        "enum_rider_transaction_recharge_correction":
            MessageLookupByLibrary.simpleMessage("تصحيح"),
        "enum_rider_transaction_recharge_gift":
            MessageLookupByLibrary.simpleMessage("هدية"),
        "enum_rider_transaction_recharge_in_app_payment":
            MessageLookupByLibrary.simpleMessage("الدفع داخل التطبيق"),
        "enum_unknown": MessageLookupByLibrary.simpleMessage("أونكونون"),
        "history_payment_method_cash":
            MessageLookupByLibrary.simpleMessage("السيولة النقدية"),
        "invoice_apply_coupon_action":
            MessageLookupByLibrary.simpleMessage("تطبيق القسيمة"),
        "invoice_coupon_discount":
            MessageLookupByLibrary.simpleMessage("خصم القسيمة"),
        "invoice_pay_online_action":
            MessageLookupByLibrary.simpleMessage("ادفع عبر الإنترنت"),
        "invoice_service_fee":
            MessageLookupByLibrary.simpleMessage("رسوم الخدمة"),
        "invoice_subtotal":
            MessageLookupByLibrary.simpleMessage("المجموع الفرعي"),
        "loading": MessageLookupByLibrary.simpleMessage("تحميل"),
        "login_cell_number_empty_error": MessageLookupByLibrary.simpleMessage(
            "الرجاء إدخال رقم الهاتف بالشكل الصحيح"),
        "login_cell_number_textfield_hint":
            MessageLookupByLibrary.simpleMessage("رقم الخلوي"),
        "login_heading_first_line":
            MessageLookupByLibrary.simpleMessage("ادخل"),
        "login_heading_second_line":
            MessageLookupByLibrary.simpleMessage("رقم الهاتف المحمول"),
        "login_heading_third_line":
            MessageLookupByLibrary.simpleMessage("سوف نرسل لك رمز التأكيد"),
        "looking_cancel_request":
            MessageLookupByLibrary.simpleMessage("إلغاء الطلب"),
        "looking_heading": MessageLookupByLibrary.simpleMessage(
            "أبحث عن توصيلة ، من فضلك انتظر ..."),
        "menu_about": MessageLookupByLibrary.simpleMessage("عن"),
        "menu_announcements": MessageLookupByLibrary.simpleMessage("الإعلانات"),
        "menu_chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "menu_login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "menu_logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "menu_profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "menu_saved_locations":
            MessageLookupByLibrary.simpleMessage("المواقع المحفوظة"),
        "menu_trip_history":
            MessageLookupByLibrary.simpleMessage("تاريخ الرحلة"),
        "menu_wallet": MessageLookupByLibrary.simpleMessage("محفظة"),
        "place_search_hint": MessageLookupByLibrary.simpleMessage(
            "أدخل الكلمات الرئيسية للموقع"),
        "point_selection_add_destination":
            MessageLookupByLibrary.simpleMessage("Add Destination"),
        "point_selection_confirm_pickup":
            MessageLookupByLibrary.simpleMessage("تأكيد موقع الالتقاط"),
        "point_selection_final_destination":
            MessageLookupByLibrary.simpleMessage("Final Destination"),
        "profile_email":
            MessageLookupByLibrary.simpleMessage("بريد الالكتروني"),
        "profile_firstname":
            MessageLookupByLibrary.simpleMessage("الاسم الأول"),
        "profile_gender":
            MessageLookupByLibrary.simpleMessage("جنس تذكير أو تأنيث"),
        "profile_lastname": MessageLookupByLibrary.simpleMessage("الكنية"),
        "profile_mobilenumber":
            MessageLookupByLibrary.simpleMessage("رقم الهاتف المحمول"),
        "review_action_submit_review":
            MessageLookupByLibrary.simpleMessage("إرسال المراجعة"),
        "review_text_heading":
            MessageLookupByLibrary.simpleMessage("كيف تقيم تجربتك؟"),
        "review_textfield_hint":
            MessageLookupByLibrary.simpleMessage("أضف تعليق"),
        "service_selection_book_later": m0,
        "service_selection_book_now":
            MessageLookupByLibrary.simpleMessage("احجز الآن"),
        "top_up_sheet_pay_button": MessageLookupByLibrary.simpleMessage("يدفع"),
        "top_up_sheet_textfield_hint":
            MessageLookupByLibrary.simpleMessage("كمية الإدخال لإعادة الشحن"),
        "trip_history_canceled_tab":
            MessageLookupByLibrary.simpleMessage("ألغيت"),
        "trip_history_completed_tab":
            MessageLookupByLibrary.simpleMessage("مكتمل"),
        "trip_history_empty_state_message":
            MessageLookupByLibrary.simpleMessage("لم يتم تسجيل أي طلب سابق."),
        "verify_phone_code_empty_message":
            MessageLookupByLibrary.simpleMessage("لم يتم إدخال رمز التحقق."),
        "verify_phone_heading_first_line":
            MessageLookupByLibrary.simpleMessage("أدخل الرمز المرسل"),
        "verify_phone_heading_second_line":
            MessageLookupByLibrary.simpleMessage("لهاتفك"),
        "verify_phone_heading_third_line":
            MessageLookupByLibrary.simpleMessage("سوف نرسل لك رمز التأكيد"),
        "wallet_activities_heading":
            MessageLookupByLibrary.simpleMessage("Activities"),
        "wallet_add_credit": MessageLookupByLibrary.simpleMessage("إضافة رصيد"),
        "wallet_empty_state_message":
            MessageLookupByLibrary.simpleMessage("لم يتم تسجيل أي سجل."),
        "wallet_gateway_empty_state":
            MessageLookupByLibrary.simpleMessage("لا توجد بوابة متاحة."),
        "wallet_other_currencies_available": m1,
        "wallet_select_currency":
            MessageLookupByLibrary.simpleMessage("اختر العملة:"),
        "wallet_select_payment_method":
            MessageLookupByLibrary.simpleMessage("اختار طريقة الدفع:"),
        "wallet_switch_currency": MessageLookupByLibrary.simpleMessage("يحول")
      };
}
