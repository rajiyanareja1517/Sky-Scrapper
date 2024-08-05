
# Sky Scrapper Project

A Sky Scrapper project created in flutter. Sky Scrapper supports both ios and android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/rajiyanareja1517/Sky-Scrapper 

Download or clone this repo by using the link below:

```
https://github.com/rajiyanareja1517/Sky-Scrapper.git
```

## Sky Scrapper:

"Sky Scrapper" is a feature-rich weather application built using Flutter, incorporating key concepts such as API calling, Shared Preferences, and network connectivity. The app offers a comprehensive set of functionalities designed to provide users with accurate and timely weather information for cities, states, and countries.
"Sky Scrapper" aims to be a reliable and user-friendly weather application, empowering users with accurate and timely weather information. By incorporating API calling, network connectivity checks, city/state/country-wise weather details, saved location functionality, light and dark themes, splash screen, and detailed weather screens, the app provides a comprehensive solution for users to stay informed about weather conditions in their desired locations

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- assets
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- model/
|- network/
|- provider/
|- screen/
|- utils/
|- main.dart
```

### screens

This directory screens all the screen of the application together in one place. A separate file is created for each type as shown in example below:

```
screens/
|- SplashScreen.dart
|- HomePage.dart
|- WeatherDetailsPage.dart
```

### utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```

|- utils/
    |- Constants/

```


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
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

```


https://github.com/user-attachments/assets/66315c45-36fb-4232-be18-a2e2576f9b7e



![Screenshot_20240804_165725](https://github.com/user-attachments/assets/e6b8f7dd-cd23-4d85-b9a1-c00b6179cc07)
![Screenshot_20240804_165802](https://github.com/user-attachments/assets/89ea4037-c273-4646-bc98-3f36927c1634)
![Screenshot_20240804_165644](https://github.com/user-attachments/assets/4bc2df84-b597-4fda-8d0a-bf5c6825c37b)
![Screenshot_20240804_165629](https://github.com/user-attachments/assets/b1d6e251-2757-4339-957d-c37bf6365107)
![Screenshot_20240804_165617](https://github.com/user-attachments/assets/16fbefac-55bb-4f7d-aed1-8c87b7a2e2ae)


## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
