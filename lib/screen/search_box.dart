import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/screen/weather_ui.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  WeatherModel? weatherModel;
  bool isLoading = false;
  callApi(String place) async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    try {
      var response = await WeatherApiSDK().getWeatherReport(place);
      Map<String, dynamic> responseBody = json.decode(response.body);
      var temp = await WeatherModel.fromJson(responseBody);
      setState(() {
        weatherModel = temp;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  // fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                      left: 15, bottom: 15, top: 15, right: 15),
                  suffixIcon: IconButton(
                    onPressed: () {
                      callApi(searchController.text);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    tooltip: 'search',
                    icon: const Icon(Icons.search_outlined),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            !isLoading
                ? ((weatherModel != null &&
                        weatherModel?.current != null &&
                        weatherModel?.forecast != null &&
                        weatherModel?.location != null)
                    ? WeatherList(weatherData: weatherModel)
                    : Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(15),
                        child: const Text('Enter City')))
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ]),
        ),
      ),
    );
  }
}
