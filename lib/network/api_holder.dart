import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skyy/utils/constants.dart';

import '../model/weather_model.dart';

class APIHolder {
  APIHolder._();

  static final APIHolder apiHolder = APIHolder._();

  Future<Map?> fetchSinglePost() async {
    http.Response responce = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=cde265e4bf09e18471d580ea430a9d64"));
    if (responce.statusCode == 200) {
      Map decodeData = jsonDecode(responce.body);
      return decodeData;
    }
  }

  Future<WeatherModel?> fetchData({required String Search}) async {
    final response = await http.get(
      Uri.parse(
          "https://api.weatherapi.com/v1/current.json?key=${Constants.API_KEY}&q=$Search&aqi=no"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      WeatherModel weather = WeatherModel.fromJson(decodedData);
      return weather;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }
}
