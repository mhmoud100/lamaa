import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:ridy/generated/l10n.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.dart';
import '../query_result_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late GetRider$Query$Rider rider;

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(document: UPDATE_PROFILE_MUTATION_DOCUMENT),
        builder: (
          RunMutation runMutation,
          QueryResult? result,
        ) {
          return Scaffold(
              //resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(S.of(context).menu_profile),
              ),
              floatingActionButton: FloatingActionButton.extended(
                icon: const Icon(Icons.save),
                label: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(S.of(context).action_save),
                ),
                onPressed: () {
                  final input = UpdateProfileArguments(
                      firstName: rider.firstName!,
                      lastName: rider.lastName!,
                      gender: rider.gender,
                      email: rider.email);
                  runMutation(input.toJson());
                  Navigator.pop(context);
                },
              ),
              body: SingleChildScrollView(
                child: Query(
                    options: QueryOptions(
                        document: GET_RIDER_QUERY_DOCUMENT,
                        fetchPolicy: FetchPolicy.noCache),
                    builder: (QueryResult result,
                        {Future<QueryResult?> Function()? refetch,
                        FetchMore? fetchMore}) {
                      if (result.hasException || result.isLoading) {
                        return QueryResultView(result);
                      }
                      rider = GetRider$Query.fromJson(result.data!).rider!;
                      return Column(children: [
                        ProfileAvatar(rider.media?.address, refetch!),
                        const SizedBox(height: 15),
                        Text(
                          "+${rider.mobileNumber}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16),
                        ),
                        Text(
                          S.of(context).profile_mobilenumber,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    initialValue: rider.firstName,
                                    onChanged: (value) =>
                                        rider.firstName = value,
                                    decoration: InputDecoration(
                                        hintText:
                                            S.of(context).profile_firstname),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: TextFormField(
                                    initialValue: rider.lastName,
                                    onChanged: (value) {
                                      rider.lastName = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText:
                                            S.of(context).profile_lastname),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: rider.email,
                              onChanged: (value) {
                                rider.email = value;
                              },
                              decoration: InputDecoration(
                                  hintText: S.of(context).profile_email),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<Gender>(
                              value: rider.gender,
                              decoration: InputDecoration(
                                  hintText: S.of(context).profile_gender),
                              items: <DropdownMenuItem<Gender>>[
                                DropdownMenuItem(
                                    value: Gender.male,
                                    child:
                                        Text(S.of(context).enum_gender_male)),
                                DropdownMenuItem(
                                    value: Gender.female,
                                    child:
                                        Text(S.of(context).enum_gender_female)),
                                DropdownMenuItem(
                                    value: Gender.unknown,
                                    child:
                                        Text(S.of(context).enum_gender_unknown))
                              ],
                              onChanged: (Gender? value) {
                                rider.gender = value;
                              },
                            )
                          ]),
                        ),
                      ]).p24();
                    }),
              ));
        });
  }
}

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final Refetch refetch;
  const ProfileAvatar(
    this.imageUrl,
    this.refetch, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: imageUrl != null
                ? Image.network(
                    serverUrl + imageUrl!,
                    width: 150,
                    height: 150,
                  )
                : Image.asset(
                    'images/default-user-image.png',
                    width: 150,
                    height: 150,
                  ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);

                  if (result != null && result.files.single.path != null) {
                    await uploadFile(result.files.single.path!);
                    refetch();
                  }
                },
                child: Container(
                    constraints:
                        const BoxConstraints(minHeight: 30, minWidth: 20),
                    child: const Icon(Icons.camera_alt))))
      ],
    );
  }

  uploadFile(String path) async {
    var postUri = Uri.parse(serverUrl + "upload_profile");
    var request = http.MultipartRequest("POST", postUri);
    request.headers['Authorization'] =
        'Bearer ${Hive.box('user').get('jwt').toString()}';
    request.files.add(await http.MultipartFile.fromPath('file', path));
    await request.send();
    // var response = await http.Response.fromStream(streamedResponse);
    // var json = jsonDecode(response.body);
    // setState(() {});
    // json['address'];
  }
}
