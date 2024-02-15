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
    return response;
  }
}
