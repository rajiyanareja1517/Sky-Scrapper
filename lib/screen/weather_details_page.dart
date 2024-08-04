import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyy/utils/constants.dart';
import 'package:weather_animation/weather_animation.dart';

import '../model/weather_model.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({super.key});

  @override
  State<WeatherDetailsPage> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Random _random = new Random();
    var theme = Constants
        .listThemeBack[_random.nextInt(Constants.listThemeBack.length)];
    final WeatherModel data =
        ModalRoute.of(context)!.settings.arguments as WeatherModel;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                child: theme.sceneWidget),
            Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            size: 27,
                          ),
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Details",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500,color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40, bottom: 200),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Location: ${data.locationName}",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Location Time: ${data.localtime}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Region: ${data.region}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Country: ${data.country}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Temperature: ${data.tempC} °C / ${data.tempF} °F",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Condition: ${data.conditionText}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Wind: ${data.windKph} kph",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Humidity: ${data.humidity}%",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Cloud: ${data.cloud}%",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Feels Like: ${data.feelslikeC} °C / ${data.feelslikeF} °F",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
