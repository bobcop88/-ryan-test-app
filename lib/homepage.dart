import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ryanairapp/test_pages/airport.dart';
import 'package:ryanairapp/autosuggestion_pages/auto_page.dart';
import 'package:ryanairapp/test_pages/cheapest_page.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:ryanairapp/onway.dart';
import 'package:ryanairapp/utils/depairport.dart';







class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool hasInternet = false;

  List<String> images = [
    'https://images.pexels.com/photos/1285625/pexels-photo-1285625.jpeg?cs=srgb&dl=pexels-aleksandar-pasaric-1285625.jpg&fm=jpg',

    'https://images.pexels.com/photos/532826/pexels-photo-532826.jpeg?cs=srgb&dl=pexels-pixabay-532826.jpg&fm=jpg',

    'https://images.pexels.com/photos/2676642/pexels-photo-2676642.jpeg?cs=srgb&dl=pexels-griffin-wooldridge-2676642.jpg&fm=jpg',

    'https://images.pexels.com/photos/1933239/pexels-photo-1933239.jpeg?cs=srgb&dl=pexels-stein-egil-liland-1933239.jpg&fm=jpg',

    'https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg?cs=srgb&dl=pexels-chris-schippers-427679.jpg&fm=jpg'

  ];

 
  


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.popAndPushNamed(context, '/');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage('assets/logo.png'),
                size: 30.0,


              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Search Ryanair'
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     Expanded(
                          child: Card(
                            elevation: 5,
                            color: Color.fromRGBO(7, 53, 144, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: Text(
                                      'One Way Flights',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110.0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(241, 201, 51, 1)),
                                      ),
                                      onPressed: () async {
                                        hasInternet = await InternetConnectionChecker().hasConnection;
                                        if(hasInternet){
                                          Navigator.pushReplacementNamed(context, '/second');
                                        }else{
                                          showDialog(
                                            context: context,
                                            builder: (context) => 
                                            AlertDialog(
                                            title: 
                                                Column(
                                                  children: [
                                                    Icon(
                                                      Icons.wifi_off_rounded,
                                                      size: 30.0,
                                                      color: Color.fromRGBO(7, 53, 144, 1),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:8.0),
                                                      child: Text(
                                                        'No Internet Connection'
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                      Text(
                                                          'Oops...'
                                                        ),
                                                      Text(
                                                          'Please check'
                                                        ),
                                                      
                                                    
                                                  ],
                                                ),
                                              ],
                                            ),
                                            elevation: 5,
                                            actions: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                    child: Text(
                                                      'OK',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                ],
                                              ),
                                            ],

                                          ),
                                            );
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.airplane_ticket_rounded,
                                            color: Color.fromRGBO(7, 53, 144, 1),
                                          ),
                                          Text(
                                            'Search',
                                            style: TextStyle(
                                              color: Color.fromRGBO(7, 53, 144, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      
  
                ],
              ),
              Row(
                children: [
                  Expanded(
                              child: Card(
                                elevation: 5,
                                color: Color.fromRGBO(7, 53, 144, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Text(
                                          'Roundtrip Flights',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 110.0,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Color.fromRGBO(241, 201, 51, 1)),
                                          ),
                                          onPressed: () async {
                                            hasInternet = await InternetConnectionChecker().hasConnection;
                                            if(hasInternet){
                                              Navigator.pushReplacementNamed(context, '/roundtripRyanair');
                                            }else{
                                              showDialog(
                                                context: context,
                                                builder: (context) => 
                                                AlertDialog(
                                                title: 
                                                    Column(
                                                      children: [
                                                        Icon(
                                                          Icons.wifi_off_rounded,
                                                          size: 30.0,
                                                          color: Color.fromRGBO(7, 53, 144, 1),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:8.0),
                                                          child: Text(
                                                            'No Internet Connection'
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                          Text(
                                                              'Oops...'
                                                            ),
                                                          Text(
                                                              'Please check'
                                                            ),
                                                          
                                                        
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                elevation: 5,
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      TextButton(
                                                        child: Text(
                                                          'OK',
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        onPressed: () => Navigator.pop(context),
                                                      ),
                                                    ],
                                                  ),
                                                ],

                                              ),
                                                );
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.airplane_ticket_rounded,
                                                color: Color.fromRGBO(7, 53, 144, 1),
                                              ),
                                              Text(
                                                'Search',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(7, 53, 144, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                ],
              ),
            ],
          ),
        ),
      bottomNavigationBar: BottomAppBar(
                  color: Color.fromRGBO(246, 137, 21,1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all( Color.fromRGBO(32, 145, 235,1)),
                        
                      ),
                              onPressed: () {
                                DepAirport.removeValueDestName();
                                DepAirport.removeValueDestCode();
                                DepAirport.removeDateFromSelected();
                                DepAirport.removeDateToSelected();
                      
                                Navigator.popAndPushNamed(context, '/');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home_filled),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0, left: 5.0),
                                    child: Text(
                                      'Back to Home',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                  ),
                ),  
       
        
      ),
    );
  }

  Future<bool> onWillPop() async {

    final shouldPop = await showDialog(
        context: context,
        builder: (context) =>
        AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you leaving now?'
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Color.fromRGBO(7, 53, 144, 1),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(241, 201, 51, 1)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Color.fromRGBO(7, 53, 144, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

        )
      );



    return shouldPop ?? false;
  }
}

