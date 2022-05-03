import 'package:flutter/material.dart';
import 'package:ryanairapp/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ryanairapp/main_page.dart';
import 'package:ryanairapp/onway.dart';
import 'package:ryanairapp/rtrip.dart';
import 'package:ryanairapp/utils/depairport.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  DepAirport.init();
  runApp( MaterialApp(
    title: 'Ryanair Cheapest App',
    initialRoute: '/',
    routes: {
      '/':(context) => const Main_Page(),
      '/homeRyanair': (context) => const HomePage(),
      '/second': (context) => const OneWayPage(),
      '/roundtripRyanair': (context) => const RoundtripPage(),
      
    },
    theme: ThemeData(
      primaryColor:Color.fromRGBO(246, 137, 21,1),
      scaffoldBackgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(246, 137, 21,1),
        
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(),
      ).apply(
        bodyColor: Color(0xFF073590),
      ),
    ),
    
  ));

}

