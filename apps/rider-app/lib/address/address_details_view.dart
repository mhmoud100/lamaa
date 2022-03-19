import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/main/map_providers/open_street_map_provider.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:velocity_x/velocity_x.dart';

class AddressDetailsView extends StatefulWidget {
  const AddressDetailsView({Key? key}) : super(key: key);

  @override
  _AddressDetailsViewState createState() => _AddressDetailsViewState();
}

class _AddressDetailsViewState extends State<AddressDetailsView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late MapController mapController;
  String title = "";
  String details = "";
  RiderAddressType? type;

  @override
  void initState() {
    mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom + 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 100,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        onChanged: (value) => title = value,
                        decoration: InputDecoration(
                          hintText:
                              S.of(context).create_address_title_textfield_hint,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return S
                                .of(context)
                                .create_address_name_empty_error;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: DropdownButtonFormField<RiderAddressType>(
                        value: type,
                        decoration: const InputDecoration(
                            hintText: "Type", isDense: true),
                        items: <DropdownMenuItem<RiderAddressType>>[
                          createAddressType(RiderAddressType.home,
                              S.of(context).enum_address_type_home, Icons.home),
                          createAddressType(RiderAddressType.work,
                              S.of(context).enum_address_type_work, Icons.work),
                          createAddressType(
                              RiderAddressType.partner,
                              S.of(context).enum_address_type_partner,
                              Icons.favorite),
                          createAddressType(
                              RiderAddressType.other,
                              S.of(context).enum_address_type_other,
                              Icons.location_on),
                        ],
                        onChanged: (RiderAddressType? value) => type = value,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
                  onChanged: (value) => details = value,
                  decoration: InputDecoration(
                    hintText:
                        S.of(context).create_address_details_textfield_hint,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).create_address_details_empty_error;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Container(
                  constraints:
                      const BoxConstraints(minHeight: 100, maxHeight: 200),
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      zoom: 15.0,
                    ),
                    children: [
                      if (mapProvider == MapProvider.openStreetMap ||
                          mapProvider == MapProvider.googleMap)
                        TileLayerWidget(
                          options: openStreepTileLayer,
                        ),
                      if (mapProvider == MapProvider.mapBox)
                        TileLayerWidget(
                          options: mapBoxTileLayer,
                        ),
                      LocationMarkerLayerWidget(
                        options: LocationMarkerLayerOptions(),
                        plugin: const LocationMarkerPlugin(
                            centerOnLocationUpdate:
                                CenterOnLocationUpdate.first),
                      ),
                      Positioned.fill(
                          child: Image.asset(
                        'images/marker_pickup.png',
                        width: 45,
                        height: 45,
                      )).centered()
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Mutation(
                    options: MutationOptions(
                        document: CREATE_ADDRESS_MUTATION_DOCUMENT),
                    builder: (
                      RunMutation runMutation,
                      QueryResult? result,
                    ) {
                      return ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await runMutation({
                                    "title": title,
                                    "details": details,
                                    "lat": mapController.center.latitude,
                                    "lng": mapController.center.longitude
                                  }).networkResult;
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(S.of(context).action_save))
                          .objectCenterRight();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  DropdownMenuItem<RiderAddressType> createAddressType(
      RiderAddressType type, String text, IconData icon) {
    return DropdownMenuItem(
        value: type,
        child: Row(children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(text),
        ]));
  }
}
