import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ryanairapp/onway.dart';
import 'package:ryanairapp/autosuggestion_pages/auto_page.dart';

// Departure Airports Api

class Airport {
  final String name;
  final String code;
  final String countryName;

  const Airport({
    required this.name,
    required this.code,
    required this.countryName,
  });

  static Airport fromJson(Map<String,dynamic> json) => Airport(
    name: json['name'],
    code: json['code'],
    countryName: json['country']['name'],
    );

}




class AirportApi{

  static Future<List<Airport>> getAirportSuggestion(String query) async {
    final url = Uri.parse('https://www.ryanair.com/api/locate/v1/autocomplete/airports?phrase=&market=en-ie');

    final response = await http.get(url);

    final List airports = json.decode(response.body);
    airports.sort(((a, b) => a['name'].compareTo(b['name'])));

    


    return airports.map((json) => Airport.fromJson(json)).where((airport){

      final nameLower = airport.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return nameLower.contains(queryLower);


    }).toList();

    


  }
}


