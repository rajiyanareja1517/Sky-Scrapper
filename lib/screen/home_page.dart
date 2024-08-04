import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skyy/model/weather_model.dart';
import 'package:skyy/network/api_holder.dart';
import 'package:skyy/provider/theam_provider.dart';

import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherModel> weatherModelList = [];

  @override
  Widget build(BuildContext context) {
    Icon darkMode = Icon(
      Icons.dark_mode,
      size: 32,
      color: Colors.black,
    );
    Icon lightMode = Icon(
      Icons.light_mode,
      size: 32,
    );

    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://assets.msn.com/weathermapdata/1/static/background/mobile/mostcloudy_sunset1.png"),
              fit: BoxFit.fill),
          gradient: LinearGradient(
            colors: [
              Color(0xff6da2cf).withOpacity(0.4),
              Color(0xff227ddb).withOpacity(0.4),
              Color(0xff4961ba).withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sky Scrapper",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  ),
                  IconButton(
                      onPressed: () {
                        Provider.of<TheamProvider>(context, listen: false)
                            .changeTheam();
                      },
                      icon: Provider.of<TheamProvider>(context, listen: false)
                              .isDark
                          ? lightMode
                          : darkMode)
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: TextField(
                      style: TextStyle(color: Colors.white,fontSize: 18),
                      controller: searchController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onSubmitted: (value) async {
                        final weatherData = await APIHolder.apiHolder
                            .fetchData(Search: searchController.text);
                        if (weatherData != null) {
                          setState(() {
                            weatherModelList.add(weatherData);
                            searchController.clear();
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(

                child: ListView.builder(
                  itemCount: weatherModelList.length,
                  itemBuilder: (context, i) {
                    final data = weatherModelList[i];
                    print(data);
                    //final photoUrl = photos[i % photos.length];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('weather_details', arguments: data);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.2),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.locationName,
                                        style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data.feelslikeC.toString(),
                                        style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Image.network(
                                        'https:${data.conditionIcon}',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
