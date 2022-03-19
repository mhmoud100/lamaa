import 'dart:io';
import 'package:flutter/foundation.dart';

String serverUrl = "http:/x.x.x.x:4000/";
String wsUrl = serverUrl.replaceFirst("http", "ws");
bool isSinglePointMode = false;
MapProvider mapProvider = MapProvider.openStreetMap;

enum MapProvider { openStreetMap, googleMap, mapBox }

// MapBox Configuration (Only if Map Provider is set to mapBox)
String mapBoxAccessToken = "";
String mapBoxUserId = "";
String mapBoxTileSetId = "";

// Google Places Configuration (Only if you are using Google Map Provider)
String placesApiKey = "";
String placesCountry = "en";
