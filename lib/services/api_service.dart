import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/radio_station.dart';

class ApiService {
  static const String _baseUrl = 'https://de1.api.radio-browser.info/json';

  static Future<List<RadioStation>> fetchStationsByCountry(String country) async {
    final response = await http.get(Uri.parse('$_baseUrl/stations/bycountry/$country'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => RadioStation.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load radio stations');
    }
  }
}
