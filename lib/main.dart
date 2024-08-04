import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyy/provider/theam_provider.dart';
import 'package:skyy/screen/home_page.dart';
import 'package:skyy/screen/splash_screen.dart';
import 'package:skyy/screen/weather_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
          create: (context) => TheamProvider())
      ],

      builder: (context, child) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: Provider.of<TheamProvider>(context,listen: true).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme:ThemeData.light(),
            darkTheme: ThemeData.dark(),
           routes: {
              '/':(context) => SplashScreen(),
             'home':(context) => HomePage(),
             'weather_details':(context) => WeatherDetailsPage(),
           },
          ),

    );
  }
}
