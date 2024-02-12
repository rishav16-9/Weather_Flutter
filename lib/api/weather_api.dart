import 'package:http/http.dart' as http;
import 'package:weather/constants/api_key.dart';

class WeatherApiSDK {
  getWeatherReport(String place) async {
    var url = Uri.https('api.weatherapi.com', '/v1/forecast.json',
        {'q': place, 'days': day, 'aqi': 'yes', 'key': apiKey});
    final http.Response response = await http.get(url);
    return response;
  }
}
