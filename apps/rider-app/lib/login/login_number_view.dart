import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ridy/generated/l10n.dart';
import '../login/login_verification_code_view.dart';

class LoginNumberView extends StatefulWidget {
  const LoginNumberView({Key? key}) : super(key: key);

  @override
  _LoginNumberViewState createState() => _LoginNumberViewState();
}

class _LoginNumberViewState extends State<LoginNumberView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  String countryCode = "+1";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom + 8),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              S.of(context).login_heading_first_line,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(S.of(context).login_heading_second_line,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Text(
              S.of(context).login_heading_third_line,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CountryCodePicker(
                  initialSelection: countryCode,
                  onChanged: (code) => countryCode = code.dialCode!,
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: S.of(context).login_cell_number_textfield_hint,
                    ),
                    onChanged: (value) => phoneNumber = value,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).login_cell_number_empty_error;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (!kIsWeb) {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: countryCode + phoneNumber,
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            constraints: const BoxConstraints(maxWidth: 600),
                            builder: (context) {
                              return LoginVerificationCodeView(
                                  verificationId: verificationId);
                            },
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    } else {
                      await FirebaseAuth.instance
                          .signInWithPhoneNumber(countryCode + phoneNumber);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12), elevation: 0),
                  child: Text(
                    S.of(context).action_next,
                    style: const TextStyle(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
