import 'package:http/http.dart' as http;
import 'package:weather/constants/api_key.dart';

class WeatherApiSDK {
  getWeatherReport(String place, {String? date}) async {
    Map<String, String> queryParam = {
      'q': place,
      'days': day,
      'aqi': 'yes',
      'key': apiKey,
    };
    if (date != null) {
      queryParam['date'] = date;
    }
    var url = Uri.https('api.weatherapi.com', '/v1/forecast.json', queryParam);
    final http.Response response = await http.get(url);
    switch (response.statusCode) {
      case 200:
        return response; // Return response if successful
      case 400:
        return response;
      case 401:
        return response.body;
      case 404:
        return response.body;
      default:
        return;
    }
    // return response;
  }
}
