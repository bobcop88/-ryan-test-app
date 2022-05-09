import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ryanairapp/api/oneway_anywhere_api.dart';
import 'package:ryanairapp/api/search_flight.dart';
import 'package:ryanairapp/onway.dart';
import 'package:ryanairapp/widgets/widgets.dart';
import 'dart:convert' show utf8;
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';
import 'package:ryanairapp/utils/depairport.dart';



class ResultPageOneWayAnywhere extends StatefulWidget {
  const ResultPageOneWayAnywhere({ Key? key }) : super(key: key);

  @override
  State<ResultPageOneWayAnywhere> createState() => _ResultPageOneWayAnywhereState();
}

class _ResultPageOneWayAnywhereState extends State<ResultPageOneWayAnywhere> {

  

  late Future<OneWayAnywhereResults> oneWayAnywhereResults;
   

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oneWayAnywhereResults = fetchOneWayAnywhereResults();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
          
        DepAirport.removeDateFromSelected();
        DepAirport.removeDateToSelected();
        DepAirport.removeValueDestName();
        DepAirport.removeValueDestCode();
        Navigator.popAndPushNamed(context, '/second');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'The Cheapest Ryanair'
          ),
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              DepAirport.removeValueDestName();
              DepAirport.removeValueDestCode();
              DepAirport.removeDateFromSelected();
              DepAirport.removeDateToSelected();
              Navigator.popAndPushNamed(context, '/homeRyanair');
            },
          ),
        ),
    
        body: 
                Container(
                  child: FutureBuilder<OneWayAnywhereResults>(
                    future: oneWayAnywhereResults,
                    builder: (context, snapshot){
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.oneWayAnywhereResults.length,
                            itemBuilder: (context, index){
                              return SingleChildScrollView(

                                child:  Column(
                            children: [
                              Row(

                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,                              
                                                children: [
                                                  Column(
                                                    children: [
                                                      
                                                      Padding(
                                                        padding: const EdgeInsets.only(top:5.0, bottom: 5.0),
                                                        child: Text(
                                                          DateFormat("dd MMMM yyyy").format(DateTime.parse(snapshot.data!.oneWayAnywhereResults[index].departureTime.split('T')[0])),
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight: FontWeight.bold,
                                                            color: Color.fromRGBO(7, 53, 144, 1),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top:5.0),
                                                child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'From',
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 13.0,
                                                        
                                                            ),
                                                          ),
                                                          Text(
                                                            snapshot.data!.oneWayAnywhereResults[index].departureAirportName,
                                                            style: TextStyle(
                                                              fontSize: 18.0,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            snapshot.data!.oneWayAnywhereResults[index].departureAirportCode,
                                                            style: TextStyle(
                                                              color: Colors.grey,
                                                            ),
                                                          ),
                                                          Text(
                                                            renderTime(snapshot.data!.oneWayAnywhereResults[index].departureTime),
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                         Column(
                                                           mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
    
                                                            Transform.rotate(
                                                              angle: math.pi / 2,
                                                              child:
                                                              Icon(
                                                                Icons.airplanemode_active,
                                                                ),
                                                            ),
                                                            Text(
                                                              snapshot.data!.oneWayAnywhereResults[index].flightNumber,
                                                              style: TextStyle(
                                                                color: Colors.grey,
                                                                fontSize: 13.0
                                                              ),
                                                            ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            'To',
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 13.0,
                                                        
                                                            ),
                                                          ),
                                                          Text(
                                                            (snapshot.data!.oneWayAnywhereResults[index].arrivalAirportName),
                                                            style: TextStyle(
                                                              fontSize: 18.0,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            snapshot.data!.oneWayAnywhereResults[index].arrivalAirportCode,
                                                            style: TextStyle(
                                                              color: Colors.grey,
                                                            ),
                                                          ),
                                                          Text(
                                                            renderTime(snapshot.data!.oneWayAnywhereResults[index].arrivalTime),
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 8.0, right: 3.0),
                                                              child: Text(
                                                                'for only',
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.w300,
                                                                  fontSize: 12.0
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              (snapshot.data!.oneWayAnywhereResults[index].priceValue).toString()+renderCurrency(snapshot.data!.oneWayAnywhereResults[index].priceCurrency),
                                                              style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight: FontWeight.bold,
                                                                color: Color.fromRGBO(7, 53, 144, 1),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 3.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            DepAirport.setResultDate(snapshot.data!.oneWayAnywhereResults[index].departureTime.split('T')[0]);
                                                            DepAirport.setDestAirportCode(snapshot.data!.oneWayAnywhereResults[index].arrivalAirportCode);

                                                            
                                                            launchUrl(
                                                              Uri.parse('https://www.ryanair.com/en/en/trip/flights/select?adults=1&teens=0&children=0&infants=0&dateOut=${DepAirport.getResultDate()!.split('T')[0]}&dateIn=&isConnectedFlight=false&isReturn=false&discount=0&promoCode=&originIata=${DepAirport.getDepAirportCode()}&destinationIata=${DepAirport.getDestAirportCode()}&tpAdults=1&tpTeens=0&tpChildren=0&tpInfants=0&tpStartDate=${DepAirport.getFromDateSelected()}&tpEndDate=&tpDiscount=0&tpPromoCode=&tpOriginIata=${DepAirport.getDepAirportCode()}&tpDestinationIata=${DepAirport.getDestAirportCode()}'),
                                                              mode: LaunchMode.externalApplication,
                                                              );
                                                            },
                                                          child: Text(
                                                            'Check in Ryanair.com',
                                                            style: TextStyle(
                                                              color: Color.fromRGBO(7, 53, 144, 1),
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty.all(Color.fromRGBO(241, 201, 51, 1)),
                                                          ),
                                                        ),
                                            
                                                    ],
                                                    ),
                                                  ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Tooltip(
                                                      triggerMode: TooltipTriggerMode.tap,
                                                      message: 'Price can change suddenly without any notice.\nRyanairApp is not responsible of any changes\nPrices displayed in the app are indicative.',
                                                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(32, 145, 235,1),
                                                        ),
                                                          textStyle: TextStyle(
                                                            color: Colors.white,

                                                        ),
                                                      showDuration: Duration(seconds: 4),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 3.0),
                                                            child: Icon(
                                                              Icons.info_outline_rounded,
                                                              size: 15.0,
                                                              color: Color.fromRGBO(32, 145, 235,1),
                                                              ),
                                                          ),
                                                          Text(
                                                            'Important information',
                                                            style: TextStyle(
                                                              decoration: TextDecoration.underline,
                                                              color: Color.fromRGBO(32, 145, 235,1)
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            
                            ],
                          ),

                              );
                            },
                          );
                      } else if (snapshot.hasError) {
                        return NoFlights(backPage: '/second',);
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Card(
                        //       elevation: 5,
                        //       child: Column(
                        //         children: [
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        //                 child: Transform.rotate(
                        //                   angle: math.pi/2,
                        //                   child: Icon(
                        //                     Icons.airplanemode_inactive_rounded,
                        //                     size: 30.0,
                        //                     color: Colors.red,
                        //                     ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Text(
                        //                 'Oops...',
                        //                 style: TextStyle(
                        //                   fontSize: 20.0,
                        //                   fontWeight: FontWeight.bold,
                                          
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Padding(
                        //                 padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        //                 child: Text(
                        //                   'No flights are available in the dates selected',
                        //                   style: TextStyle(
                        //                     fontSize: 17.0,
                        //                     fontWeight: FontWeight.w400,
                                            
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.only(bottom: 10.0),
                        //                 child: ElevatedButton(
                        //                   child: Text(
                        //                     'Change Dates'
                        //                   ),
                        //                   onPressed: () {
                        //                     DepAirport.removeDateFromSelected();
                        //                     DepAirport.removeDateToSelected();
                        //                     Navigator.popAndPushNamed(context, '/second');
                        //                   },
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                              
                        //     ),
                        //   ],
                        // );
                      }
                      return const CircularProgressIndicator();
                    },
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
                                DepAirport.removeDateFromSelected();
                                DepAirport.removeDateToSelected();
                                DepAirport.removeValueDestName();
                                DepAirport.removeValueDestCode();
                                Navigator.popAndPushNamed(context, '/second');
                              },
                              child: Text(
                                'Back to Search Page',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                  ),
                ),
             
        
      ),
    );
  }

  String renderTime(time)  {

    var fullTime = time.split('T')[1];

    var timeParts = fullTime.split(':');

    return '${timeParts[0]}:${timeParts[1]}';

  }

  String renderCurrency(currency){

    if(currency == 'EUR'){
      return String.fromCharCode(0x20AC);
    }else if(currency == 'GBP'){

      return String.fromCharCode(0x00A3);
    }else{

      return currency;
    }


  }

 
    
     


    
    
    

    

  
}