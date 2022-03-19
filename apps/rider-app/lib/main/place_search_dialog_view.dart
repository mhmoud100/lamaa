import 'package:flutter/material.dart';
import 'package:ridy/generated/l10n.dart';
import 'dart:async';
import 'package:velocity_x/velocity_x.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

class PlaceSearchDialogView extends StatefulWidget {
  final Function(Place place) onSelected;
  const PlaceSearchDialogView(this.onSelected, {Key? key}) : super(key: key);

  @override
  _PlaceSearchDialogViewState createState() => _PlaceSearchDialogViewState();
}

class _PlaceSearchDialogViewState extends State<PlaceSearchDialogView> {
  List<Place> address = [];
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: S.of(context).place_search_hint,
                prefixIcon: const Icon(Icons.search)),
            controller: _controller,
            onChanged: _onSearchChanged,
          ).p4(),
          Expanded(
            flex: address.length > 5 ? 1 : 0,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: address.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(address[index].displayName),
                    onTap: () {
                      widget.onSelected(address[index]);
                      Navigator.pop(context);
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final res = await Nominatim.searchByName(query: query);
      if (mounted) {
        setState(() {
          address = res;
        });
      }
    });
  }
}
