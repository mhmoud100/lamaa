import 'dart:io';
import 'package:flutter/foundation.dart';

String serverUrl = "http://x.x.x.x:4002/";
String wsUrl = serverUrl.replaceFirst("http", "ws");
bool demoMode = true;
MapProvider mapProvider = MapProvider.openStreetMap;

enum MapProvider { openStreetMap, googleMap, mapBox }

// MapBox Configuration (Only if Map Provider is set to mapBox)
String mapBoxAccessToken = "";
String mapBoxUserId = "";
String mapBoxTileSetId = "";
