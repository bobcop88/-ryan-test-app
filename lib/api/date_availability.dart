import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ryanairapp/utils/depairport.dart';


class DateFlights {

  final String firstDate;
  final String lastDate;


  const DateFlights({
    required this.firstDate,
    required this.lastDate,

  });

  factory DateFlights.fromJson(Map<String, dynamic> json){

    return DateFlights(
      firstDate: json['firstFlightDate'],
      lastDate: json['lastFlightDate'],
    );
  }
}


Future<DateFlights> fetchDateFlights() async {
  final response = await http.get(Uri.parse('https://services-api.ryanair.com/timtbl/3/schedules/${DepAirport.getDepAirportCode()}/${DepAirport.getDestAirportCode()}/period'));

  final dates = DateFlights.fromJson(json.decode(response.body));

  
  DepAirport.setFromDate(dates.firstDate);
  DepAirport.setToDate(dates.lastDate);

 

  
  
  

  

  return dates;

}