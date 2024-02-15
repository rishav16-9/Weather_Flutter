import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/screen/weather_ui.dart';
import 'package:weather/constants/string_constants.dart' as string_constants;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  WeatherModel? weatherModel;
  bool isLoading = false;
  String? errorMessage;
  bool isError = false;
  final GlobalKey<FormState> _searchKey = GlobalKey<FormState>();
  callApi(String place) async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    try {
      var response = await WeatherApiSDK().getWeatherReport(place);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        var temp = await WeatherModel.fromJson(responseBody);
        setState(() {
          weatherModel = temp;
          isLoading = false;
        });
      } else {
        setState(() {
          Map<String, dynamic> responseBody = json.decode(response.body);
          isLoading = false;
          errorMessage = responseBody['error']['message'];
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      log(e.toString());
    }
  }

  bool validate() {
    setState(() {
      try {
        isError = !_searchKey.currentState!.validate();
      } catch (e) {
        log(e.toString());
      }
    });
    if (_searchKey.currentState?.validate() ?? false) {
      return false;
    } else {
      return true;
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
              child: Form(
                key: _searchKey,
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
                        String place = searchController.text;
                        if (place.isNotEmpty) {
                          callApi(place);
                          FocusScope.of(context).requestFocus(FocusNode());
                        } else {
                          setState(() {
                            validate();
                          });
                        }
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
                  validator: (value) {
                    if (value == '') {
                      errorMessage =
                          '${'Enter '}${string_constants.placeSearch}';
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ),
            !isLoading
                ? ((weatherModel != null &&
                        weatherModel?.current != null &&
                        weatherModel?.forecast != null &&
                        weatherModel?.location != null)
                    ? WeatherList(
                        weatherData: weatherModel,
                        screen: 'main',
                      )
                    : Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(15),
                        child: Text(errorMessage != null
                            ? errorMessage.toString()
                            : string_constants.enterCity)))
                : const Center(
                    heightFactor: 15,
                    child: CircularProgressIndicator(),
                  )
          ]),
        ),
      ),
    );
  }
}
