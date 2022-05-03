import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ryanairapp/api/airport_api.dart';
import 'package:ryanairapp/onway.dart';
import 'package:ryanairapp/utils/depairport.dart';


//Departure Airports Suggestion page

class AutoPage extends StatefulWidget {
  final String valDep;
  
  const AutoPage( { Key? key, required this.valDep}) : super(key: key);

  @override
  State<AutoPage> createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {



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
            'Select Departure Airport'
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                child: Container(
                  width: 350.0,
                  child: TypeAheadField<Airport?>(
                    debounceDuration: Duration(milliseconds: 500,),
                    hideOnLoading: true,
                    textFieldConfiguration: TextFieldConfiguration(
                      autofocus: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(5.0),
                        // ),
                        hintText: 'Select Airport',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    suggestionsCallback: 
                    
                    AirportApi.getAirportSuggestion,
                    itemBuilder: (context, Airport? suggestion) {
                
                      
                      
                      final airport = suggestion!;
                
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              airport.name,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
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
                          airport.countryName,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                            width: 0.2,
                          ),
                        ),
                
                      );
                
                
                    },
                    onSuggestionSelected: (Airport? suggestion) {
                      final airport = suggestion!;
                      DepAirport.setDepAirport('${airport.name}');
                      DepAirport.setDepAirportCode('${airport.code}');
                
                      ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          'You will fly from: ${airport.name}',
                          ),
                        action: SnackBarAction(
                          label: 'Departure',
                          textColor: Color.fromRGBO(241, 201, 51, 1),
                          onPressed: () {},
                          ),
                        backgroundColor: Color.fromRGBO(7, 53, 144, 1),
                        ),
                      );
                      setState(() {

                        if(widget.valDep == 'oneway'){
                          Navigator.popAndPushNamed(
                                    context,
                                    '/second',
                                     );
                        }
                        if(widget.valDep == 'roundtrip'){
                          Navigator.popAndPushNamed(
                            context,
                             '/roundtripRyanair'
                             );
                        }
                        

                        
                        // Navigator.popAndPushNamed(
                        //             context,
                        //             '/second',
                        //              );
                      });
                    },
                    noItemsFoundBuilder: (BuildContext context){
                
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                        child: Text(
                          'No airport found. Please try again',
                          
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, error) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                        child: Text(
                          'No airport found. Please try again',
                          
                        ),
                      );
                    },
                  ),
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

