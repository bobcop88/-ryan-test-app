import 'package:flutter/material.dart';
import 'package:ryanairapp/utils/depairport.dart';
import 'dart:math' as math;

class NoInternet extends StatefulWidget {
  const NoInternet({ Key? key }) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                              Expanded(
                                child: Text(
                                    'Oops...Please check your internet connection and retry',
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.center,
                                  ),
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

                  );
  }
}

class NoFlights extends StatefulWidget {

  final String backPage;
  const NoFlights({ Key? key, required this.backPage }) : super(key: key);

  @override
  State<NoFlights> createState() => _NoFlightsState();
}

class _NoFlightsState extends State<NoFlights> {
  @override
  Widget build(BuildContext context) {
    return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 5,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                        child: Transform.rotate(
                                          angle: math.pi/2,
                                          child: Icon(
                                            Icons.airplanemode_inactive_rounded,
                                            size: 30.0,
                                            color: Colors.red,
                                            ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Oops...',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                        child: Text(
                                          'No flights are available in the period you chose',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400,
                                            
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                          child: Text(
                                            'Try to select a wider period and search again. Ryanair does not offer daily flights to all destinations.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            'Change Dates'
                                          ),
                                          onPressed: () {
                                            DepAirport.removeDateFromSelected();
                                            DepAirport.removeDateToSelected();
                                            Navigator.popAndPushNamed(context, widget.backPage);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              
                            ),
                          ],
                        );
  }
}