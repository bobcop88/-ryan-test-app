import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ryanairapp/utils/depairport.dart';






class ArrivalAirportsTest {

  final List<ArrivalAirports> arrivalAirports;

  ArrivalAirportsTest({required this.arrivalAirports});

  factory ArrivalAirportsTest.fromJson(Map<String, dynamic> json) {

    List<ArrivalAirports> tempAirports = [];

    for(int i = 0; i < json.length; i++){

      ArrivalAirports flights = ArrivalAirports.fromJson(json);
      tempAirports.add(flights);
    }
    return ArrivalAirportsTest(arrivalAirports: tempAirports);
  }

  
}

 class ArrivalAirports{

  final String departureAirportName;
  final String departureAirportCode;
  final String arrivalAirportName;
  final String arrivalAirportCode;
  final String flightNumber;

  ArrivalAirports({

    required this.departureAirportName,
    required this.departureAirportCode,
    required this.arrivalAirportName,
    required this.arrivalAirportCode,
    required this.flightNumber,
    
  });

  factory ArrivalAirports.fromJson(Map<String, dynamic> json){
    return ArrivalAirports(
      departureAirportName: json['outbound']['departureAirport']['name'],
      departureAirportCode: json['outbound']['departureAirport']['iataCode'],
      arrivalAirportName: json['outbound']['arrivalAirport']['name'],
      arrivalAirportCode: json['outbound']['arrivalAirport']['iataCode'],
      flightNumber: json['outbound']['flightNumber'],


    );
  }
  
}


Future<ArrivalAirportsTest> fetchFaresResults(url) async {

  


  final response = await http.get(Uri.parse(url));


  try{

  final results = ArrivalAirportsTest.fromJson(json.decode(response.body));

  

     
  return results;

  }catch(e){

    return Future.error(e);
  }
}




// https://www.ryanair.com/api/farfnd/3/oneWayFares?=&departureAirportIataCode=PFO&language=en&limit=16&market=en-gb&offset=0&outboundDepartureDateFrom=2022-05-01&outboundDepartureDateTo=2023-05-01&priceValueTo=150






// class FlightResults{

//   final String departureAirportName;
//   final String departureAirportCode;
//   final String arrivalAirportName;
//   final String arrivalAirportCode;
//   final String departureTime;
//   final String arrivalTime;
//   final String flightNumber;
//   final double priceValue;
//   final String priceCurrency;
//   final int totalCheck;


//   FlightResults({

//     required this.departureAirportName,
//     required this.departureAirportCode,
//     required this.arrivalAirportName,
//     required this.arrivalAirportCode,
//     required this.departureTime,
//     required this.arrivalTime,
//     required this.flightNumber,
//     required this.priceValue,
//     required this.priceCurrency,
//     required this.totalCheck,
//   });


//   factory FlightResults.fromJson(Map<String, dynamic> json){


//       if(json['total'] == 0){

//         throw Error();
//       }
      
//       else{


//       List fares = json['fares'];
      

//       for(var i = 0; i< fares.length; i++){

//          FlightResults(
//           totalCheck: json['total'],
//           departureAirportName: json['fares'][0]['outbound']['departureAirport']['name'],
//           departureAirportCode: json['fares'][0]['outbound']['departureAirport']['iataCode'],
//           arrivalAirportName: json['fares'][0]['outbound']['arrivalAirport']['name'],
//           arrivalAirportCode: json['fares'][0]['outbound']['arrivalAirport']['iataCode'],
//           departureTime: json['fares'][0]['outbound']['departureDate'],
//           arrivalTime: json['fares'][0]['outbound']['arrivalDate'],
//           flightNumber: json['fares'][0]['outbound']['flightNumber'],
//           priceValue: json['fares'][0]['outbound']['price']['value'],
//           priceCurrency: json['fares'][0]['outbound']['price']['currencyCode'],

//           );

        

//       }
//       return;

//       }
//   }

  


// }

// Future<FlightResults> fetchFlightResults() async {

  


//   final response = await http.get(Uri.parse('https://services-api.ryanair.com/farfnd/3/oneWayFares?=&arrivalAirportIataCode=${DepAirport.getDestAirportCode()}&departureAirportIataCode=${DepAirport.getDepAirportCode()}&language=en&limit=100&market=en-gb&offset=0&outboundDepartureDateFrom=${DepAirport.getFromDateSelected()}&outboundDepartureDateTo=${DepAirport.getToDateSelected()}&priceValueTo=10000'));


//   try{

//   final results = FlightResults.fromJson(json.decode(response.body));

  

     
//   return results;

//   }catch(e){

//     return Future.error(e);
//   }
  


  
    
  
  
  




  
// }