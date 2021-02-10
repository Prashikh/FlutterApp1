import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'place.dart';

class PlacesService {
  final key = 'AIzaSyBSbce98wfAFHs08hfr-OYsza9SHAh4_HU';

  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=parking&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
