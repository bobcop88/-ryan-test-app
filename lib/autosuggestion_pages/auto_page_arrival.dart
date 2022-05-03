import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ryanairapp/api/airport_api.dart';
import 'package:ryanairapp/api/arrival_airport_api.dart';
import 'package:ryanairapp/api/date_availability.dart';
import 'package:ryanairapp/onway.dart';
import 'package:ryanairapp/utils/depairport.dart';


//Departure Airports Suggestion page

class ArrivalAutoPage extends StatefulWidget {

  final String valDest;
  
  const ArrivalAutoPage( { Key? key, required this.valDest }) : super(key: key);

  @override
  State<ArrivalAutoPage> createState() => _AutoPageState();
}

class _AutoPageState extends State<ArrivalAutoPage> {

  // late Future<List<ArrivalAirport>> arrivalAiportTest;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   arrivalAiportTest = getArrivalAirportSuggestion();
  // }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popAndPushNamed(context, '/second');
        return false;
      },
      child: Scaffold(
    
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Select the Destination'
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                child: 
                
                Container(
                  width: 350.0,
                  child: TypeAheadField<ArrivalAirport?>(
                        debounceDuration: Duration(milliseconds: 500,),
                        hideOnLoading: true,
                        // hideKeyboard: true,
                        textFieldConfiguration: TextFieldConfiguration(
                          autofocus: true,
                          
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(20.0),
                            // ),
                            hintText: 'Select Destination',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                        suggestionsCallback: ArrivalAirportApi.getArrivalAirportSuggestion,

                        itemBuilder: (context, ArrivalAirport? suggestion) {
                
                          
                          
                          final airport = suggestion!;
                
                          return ListTile(
                            
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Text(
                                  airport.name,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    airport.code,
                                    style: TextStyle(
                                      color: Color.fromRGBO(7, 53, 144, 1),
                                      fontSize: 15.0
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              airport.arrivalCountry,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey,
                                width: 0.2,
                              ),
                            ),
                
                          );
                
                
                        },
                        onSuggestionSelected: (ArrivalAirport? suggestion) {
                          final airport = suggestion!;
                
                          DepAirport.setDestAirport('${airport.name}');
                          DepAirport.setDestAirportCode('${airport.code}');
                          

                          ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text(
                              'You will fly to: ${airport.name}',
                                ),
                            action: SnackBarAction(
                              label: 'Destination',
                              textColor: Color.fromRGBO(241, 201, 51, 1),
                              onPressed: () {},
                              ),
                            backgroundColor: Color.fromRGBO(7, 53, 144, 1),
                            ),
                          );
                          
                          setState(() {

                            if(widget.valDest == 'oneway'){

                            fetchDateFlights();
                           
                            Navigator.popAndPushNamed(
                                        context,
                                        '/second',
                                         );

                            }

                            if(widget.valDest == 'roundtrip'){
                              fetchDateFlights();

                              Navigator.popAndPushNamed(
                                        context,
                                        '/roundtripRyanair',
                                         );
                            }
                            
                          });
                        },
                      ),

                      



                      // 
                    
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(7, 53, 144, 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text(
                'Back',
              ),
              
              onPressed: () {
                Navigator.popAndPushNamed(context, '/second');
              },
            ),
          ),
        ),
        
      ),
    );
  }
}





                      // FutureBuilder<List<ArrivalAirport>>(
                      //     future: arrivalAiportTest,
                      //     builder: (context, snapshot){
                      //       if(snapshot.hasData){
                              
                      //         return ListView.builder(
                      //           itemCount: snapshot.data!.length,
                      //           itemBuilder: (context, index){
                      //             return SingleChildScrollView(
                      //               child: Column(
                      //                 children: [
                                        
                      //                   Text(
                      //                     snapshot.data![index].name
                      //                   ),
                      //                   Text(
                      //                     snapshot.data![index].code
                      //                   ),
                      //                   Text(
                      //                     snapshot.data![index].arrivalCountry
                      //                   ),
                      //                 ],
                      //               ),
                      //             );
                      //           },

                      //         );



                      //       }else if(snapshot.hasError){

                      //         return Text('${snapshot.error}');
                      //       }
                      //       return const CircularProgressIndicator();
                      //     },

                      //   ),