import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:ridy/generated/l10n.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginVerificationCodeView extends StatefulWidget {
  final String verificationId;
  const LoginVerificationCodeView({Key? key, required this.verificationId})
      : super(key: key);

  @override
  _LoginVerificationCodeViewState createState() =>
      _LoginVerificationCodeViewState();
}

class _LoginVerificationCodeViewState extends State<LoginVerificationCodeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String code = "";
  @override
  void initState() {
    initCodeListener();
    super.initState();
  }

  Future<void> initCodeListener() async {
    if (Platform.isIOS) SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom + 8),
        child: Mutation(
            options: MutationOptions(
                document:
                    LoginMutation(variables: LoginArguments(firebaseToken: ""))
                        .document),
            builder: (RunMutation runMutation, QueryResult? result) {
              return Form(
                key: _formKey,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).verify_phone_heading_first_line,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(S.of(context).verify_phone_heading_second_line,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).verify_phone_heading_third_line,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 5),
                          Flexible(
                            child: (Platform.isAndroid || Platform.isIOS)
                                ? PinFieldAutoFill(
                                    onCodeChanged: (code) =>
                                        this.code = code ?? "",
                                  )
                                : PinInputTextField(
                                    onChanged: (code) => this.code = code),
                          ),
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (code.length < 6) {
                                  final snackBar = SnackBar(
                                      content: Text(S
                                          .of(context)
                                          .verify_phone_code_empty_message));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  return;
                                }
                                login(code, runMutation);
                              },
                              child: Text(
                                S.of(context).action_next,
                                style: const TextStyle(fontSize: 16),
                              ))),
                    ]),
              );
            }));
  }

  void login(String code, RunMutation runMutation) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: code);
    final UserCredential cr =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final String firebaseToken = await cr.user!.getIdToken();
    final QueryResult qe =
        await runMutation({"firebaseToken": firebaseToken}).networkResult!;
    final String jwt = Login$Mutation.fromJson(qe.data!).login.jwtToken;
    final Box box = await Hive.openBox('user');
    box.put("jwt", jwt);
    Navigator.pop(context);
  }
}
