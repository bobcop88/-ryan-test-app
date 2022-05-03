import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ryanairapp/utils/depairport.dart';






class FaresResults {

  final List<Flights> faresResults;

  FaresResults({required this.faresResults});

  factory FaresResults.fromJson(Map<String, dynamic> json) {

    List<Flights> tempFares = [];

    for(int i = 0; i < json['fares'].length; i++){

      Flights flights = Flights.fromJson(json['fares'][i]);
      tempFares.add(flights);
    }
    return FaresResults(faresResults: tempFares);
  }

  
}

 class Flights{

  final String departureAirportName;
  final String departureAirportCode;
  final String arrivalAirportName;
  final String arrivalAirportCode;
  final String flightNumber;

  Flights({

    required this.departureAirportName,
    required this.departureAirportCode,
    required this.arrivalAirportName,
    required this.arrivalAirportCode,
    required this.flightNumber,
    
  });

  factory Flights.fromJson(Map<String, dynamic> json){
    return Flights(
      departureAirportName: json['outbound']['departureAirport']['name'],
      departureAirportCode: json['outbound']['departureAirport']['iataCode'],
      arrivalAirportName: json['outbound']['arrivalAirport']['name'],
      arrivalAirportCode: json['outbound']['arrivalAirport']['iataCode'],
      flightNumber: json['outbound']['flightNumber'],


    );
  }
  
}


Future<FaresResults> fetchFaresResults(url) async {

  


  final response = await http.get(Uri.parse(url));


  try{

  final results = FaresResults.fromJson(json.decode(response.body));

  

     
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