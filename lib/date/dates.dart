import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ryanairapp/api/date_availability.dart';
import 'package:ryanairapp/utils/depairport.dart';
import 'package:intl/intl.dart';



class DateRangePickerWidget extends StatefulWidget {

  final String tripType;

  const DateRangePickerWidget({ Key? key, required this.tripType }) : super(key: key);

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {

  final List<bool> isSelected = [false, false, false];


  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 5)) ,

  );

  

  String getFrom() {
    
    if(DepAirport.getFromDateSelected() == null){
      return 'From';
    }else{
      return  DateFormat('dd MMMM yyyy').format(dateRange.start);
    }
  }



  String getUntil() {

    if(DepAirport.getToDateSelected() == null){
      return 'To';
    }else{
      return DateFormat('dd MMMM yyyy').format(dateRange.end);
    }
  }


  @override
  Widget build(BuildContext context) {

    if(widget.tripType == 'oneway'){

    return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'When would you like to travel?',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Tooltip(
                        message: 'Here you can enter the period of time in which you would like to find the cheapest flight',
                        padding: EdgeInsets.all(10.0),
                        preferBelow: false,
                        showDuration: Duration(seconds: 2),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 145, 235,1),
                        ),
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0, left: 3.0),
                          child: Icon(
                            Icons.info,
                            size: 15.0,
                            color: Color.fromRGBO(32, 145, 235,1) ,
                          ),
                        ),
                        triggerMode: TooltipTriggerMode.tap,
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                indent: 100,
                endIndent: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children:[ TextButton(
                      onPressed: () {

                        if(DepAirport.getDestAirportCode() == null){

                          showDialog(
                            context: context,
                            builder: (context){
                                  return AlertDialog(
                                  title: Text(
                                    'Please select a Destination'
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: Text(
                                            'Ok'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                            return;
                        }else{

                        pickDateRange.call();
                        }

                        },
                      child: Text(
                        getFrom(),
                        style: TextStyle(
                          color: Color(0xFF073590),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    ]),
                    Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  Column(
                    children: [TextButton(
                      onPressed: () {
                        if(DepAirport.getDestAirportCode() == null){

                          showDialog(
                            context: context,
                            builder: (context){
                                  return AlertDialog(
                                  title: Text(
                                    'Please select a Destination'
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: Text(
                                            'Ok'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                            return;
                        }
                        
                      pickDateRange.call();

                      },
                      child: Text(
                        getUntil(),
                        style: TextStyle(
                          color: Color(0xFF073590),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    ]),
                  
                ],
               
              ),
            ],
          ),
          
        ),
    );


    }

  if(widget.tripType == 'roundtrip'){


    
    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Which period will you travel?',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Tooltip(
                        message: 'Here you can enter the period of time in which you would like to find the cheapest flight',
                        padding: EdgeInsets.all(10.0),
                        preferBelow: false,
                        showDuration: Duration(seconds: 2),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 145, 235,1),
                        ),
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1.0, left: 5.0),
                          child: Icon(
                            Icons.info,
                            size: 18.0,
                            color: Color.fromRGBO(32, 145, 235,1) ,
                          ),
                        ),
                        triggerMode: TooltipTriggerMode.tap,
                      ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children:[ TextButton(
                      onPressed: () {

                        if(DepAirport.getDestAirportCode() == null){

                          showDialog(
                            context: context,
                            builder: (context){
                                  return AlertDialog(
                                  title: Text(
                                    'Please select a Destination'
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: Text(
                                            'Ok'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                            return;
                        }else{

                        pickDateRange.call();
                        }

                        },
                      child: Text(
                        getFrom(),
                        style: TextStyle(
                          color: Color(0xFF073590),
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    ]),
                    Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  Column(
                    children: [
                      TextButton(
                      onPressed: () {
                        if(DepAirport.getDestAirportCode() == null){

                          showDialog(
                            context: context,
                            builder: (context){
                                  return AlertDialog(
                                  title: Text(
                                    'Please select a Destination'
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: Text(
                                            'Ok'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                            return;
                        }
                        
                      pickDateRange.call();

                      },
                      child: Text(
                        getUntil(),
                        style: TextStyle(
                          color: Color(0xFF073590),
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    ]),
                  
                ],
               
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                indent: 100,
                endIndent: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'How many days in Destination?',
                            style: TextStyle(
                              fontSize: 16.0
                            ),
                          ),

                          ],
                        ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ToggleButtons(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '1-3 days'
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '4-7 Days'
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '8-14 Days'
                              ),
                            ),

                          ],
                          renderBorder: true,
                          borderColor: Colors.white,
                          color: Color.fromRGBO(32, 145, 235,1),
                          selectedBorderColor: Color(0xFF073590),
                          selectedColor: Color.fromRGBO(32, 145, 235,1),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          fillColor: Colors.white,
                          constraints: BoxConstraints(
                            minWidth: 25.0,
                            minHeight: 20.0
                          ),
                          isSelected: isSelected,
                          // textStyle: TextStyle(
                          //   color: Color.fromRGBO(32, 145, 235,1),
                          // ),
                          onPressed: (int index) {
                            setState(() {

                              
                              for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                                if (buttonIndex == index) {
                                  isSelected[buttonIndex] = true;
                                  if(isSelected[0]){
                                    DepAirport.setDurationFrom(1.toString());
                                    DepAirport.setDurationTo(3.toString());
                                  }
                                  if(isSelected[1]){
                                    DepAirport.setDurationFrom(4.toString());
                                    DepAirport.setDurationTo(7.toString());
                                  }
                                  if(isSelected[2]){
                                    DepAirport.setDurationFrom(8.toString());
                                    DepAirport.setDurationTo(14.toString());
                                  }
                                  

                                } else {
                                  isSelected[buttonIndex] = false;
                                }
                              }
                            });
                          },
                          
                        ),
                        
                        
                      ],
                    ),
 
                  ],
                ),
              ),
            ],
          );
          
        
    
  }else{

    return Container(
      child: Text(
        'Return'
      )
    );
  }




  }



  Future pickDateRange() async {

      
      DateTime getDateCorrect() {

        if(DateTime.now().isAfter(DateTime.parse(DepAirport.getFromDate()!))){

          return DateTime.now();
        }else{
          return DateTime.parse(DepAirport.getFromDate()!);
        }
      }

      

      
      

    final newDateRange = await showDateRangePicker(
      context: context,
      // initialDateRange: dateRange,
      firstDate:  getDateCorrect(),
      lastDate: DateTime.parse(DepAirport.getToDate()!),
      helpText: '${DepAirport.getDepAirport()} to ${DepAirport.getDestAirport()}',
      saveText: 'GO NOW',
      initialEntryMode:  DatePickerEntryMode.calendarOnly,
      builder: (context, child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromRGBO(7, 53, 144, 1), // header background color
              onPrimary: Color.fromARGB(255, 247, 247, 247), // header text color
              onSurface: Colors.black, // body text color
              
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          child: child!
        );
        
      }
      

      );

      if(newDateRange == null) return;
      setState(() =>  {
        dateRange = newDateRange,
        DepAirport.setFromDateSelected(DateFormat('yyyy-MM-dd').format(dateRange.start)),
        DepAirport.setToDateSelected(DateFormat('yyyy-MM-dd').format(dateRange.end)),

        
        
        
        });

       
  }

}


class DateAnywhere extends StatefulWidget {

  final String tripType;
  const DateAnywhere({ Key? key, required this.tripType}) : super(key: key);

  @override
  State<DateAnywhere> createState() => _DateAnywhereState();
}

class _DateAnywhereState extends State<DateAnywhere> {

  final List<bool> isSelected = [false, false, false];

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 5)) ,

  );

  String getFrom() {
    
    if(DepAirport.getFromDateSelected() == null){
      return 'From';
    }else{
      return  DateFormat('dd MMMM yyyy').format(dateRange.start);
    }
  }



  String getUntil() {

    if(DepAirport.getToDateSelected() == null){
      return 'To';
    }else{
      return DateFormat('dd MMMM yyyy').format(dateRange.end);
    }
  }


  void _show() async {

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(), 
      lastDate: DateTime.now().add(Duration(days: 365)),
      currentDate: DateTime.now(),
      initialEntryMode:  DatePickerEntryMode.calendarOnly,
      builder: (context, child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromRGBO(7, 53, 144, 1), // header background color
              onPrimary: Color.fromARGB(255, 247, 247, 247), // header text color
              onSurface: Colors.black, // body text color
              
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          child: child!
        );
        
      }

      );

      if(newDateRange == null) return;
      setState(() {
        dateRange = newDateRange;
        DepAirport.setFromDateSelected(DateFormat('yyyy-MM-dd').format(dateRange.start));
        DepAirport.setToDateSelected(DateFormat('yyyy-MM-dd').format(dateRange.end));
      });
  }

  @override
  Widget build(BuildContext context) {

    if(widget.tripType == 'oneway'){

    return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'When would you like to travel?',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Tooltip(
                        message: 'Here you can enter the period of time in which you would like to find the cheapest flight',
                        padding: EdgeInsets.all(10.0),
                        preferBelow: false,
                        showDuration: Duration(seconds: 2),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 145, 235,1),
                        ),
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1.0, left: 5.0),
                          child: Icon(
                            Icons.info,
                            size: 18.0,
                            color: Color.fromRGBO(32, 145, 235,1) ,
                          ),
                        ),
                        triggerMode: TooltipTriggerMode.tap,
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                indent: 100,
                endIndent: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children:[ TextButton(
                      onPressed: () {

                        if(DepAirport.getDepAirportCode() == null){

                          showDialog(
                            context: context,
                            builder: (context){
                                  return AlertDialog(
                                  title: Text(
                                    'Please select a Destination'
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: Text(
                                            'Ok'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                            return;
                        }else{

                        _show.call();
                        }

                        },
                      child: Text(
                        getFrom(),
                        style: TextStyle(
                          color: Color(0xFF073590),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    ]),
                    Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  Column(
                    children: [TextButton(
                      onPressed: () {
                        if(DepAirport.getDepAirportCode() == null){

                          showDialog(
                            context: context,
                            builder: (context){
                                  return AlertDialog(
                                  title: Text(
                                    'Please select a Destination'
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: Text(
                                            'Ok'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                            return;
                        }
                        
                      _show.call();

                      },
                      child: Text(
                        getUntil(),
                        style: TextStyle(
                          color: Color(0xFF073590),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    ]),
                  
                ],
               
              ),
            ],
          ),
          
        ),
    );
    }
    //end if

    if(widget.tripType == 'roundtrip'){
      return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Which period will you travel?',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Tooltip(
                        message: 'Here you can enter the period of time in which you would like to find the cheapest flight',
                        padding: EdgeInsets.all(10.0),
                        preferBelow: false,
                        showDuration: Duration(seconds: 2),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 145, 235,1),
                        ),
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1.0, left: 5.0),
                          child: Icon(
                            Icons.info,
                            size: 18.0,
                            color: Color.fromRGBO(32, 145, 235,1) ,
                          ),
                        ),
                        triggerMode: TooltipTriggerMode.tap,
                      ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children:[ TextButton(
                      onPressed: () {

                        if(DepAirport.getDepAirportCode() == null){

                          showDialog(
                            context: context,
                            builder: (context){
                                  return AlertDialog(
                                  title: Text(
                                    'Please select a Destination'
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: Text(
                                            'Ok'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                            return;
                        }else{

                        _show.call();
                        }

                        },
                      child: Text(
                        getFrom(),
                        style: TextStyle(
                          color: Color(0xFF073590),
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    ]),
                    Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  Column(
                    children: [
                      TextButton(
                      onPressed: () {
                        if(DepAirport.getDepAirportCode() == null){

                          showDialog(
                            context: context,
                            builder: (context){
                                  return AlertDialog(
                                  title: Text(
                                    'Please select a Destination'
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: Text(
                                            'Ok'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                            return;
                        }
                        
                      _show.call();

                      },
                      child: Text(
                        getUntil(),
                        style: TextStyle(
                          color: Color(0xFF073590),
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    ]),
                  
                ],
               
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                indent: 100,
                endIndent: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'How many days in Destination?',
                            style: TextStyle(
                              fontSize: 16.0
                            ),
                          ),

                          ],
                        ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ToggleButtons(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '1-3 days'
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '4-7 Days'
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '8-14 Days'
                              ),
                            ),

                          ],
                          renderBorder: true,
                          borderColor: Colors.white,
                          color: Color.fromRGBO(32, 145, 235,1),
                          selectedBorderColor: Color(0xFF073590),
                          selectedColor: Color.fromRGBO(32, 145, 235,1),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          fillColor: Colors.white,
                          constraints: BoxConstraints(
                            minWidth: 25.0,
                            minHeight: 20.0
                          ),
                          isSelected: isSelected,
                          // textStyle: TextStyle(
                          //   color: Color.fromRGBO(32, 145, 235,1),
                          // ),
                          onPressed: (int index) {
                            setState(() {

                              
                              for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                                if (buttonIndex == index) {
                                  isSelected[buttonIndex] = true;
                                  if(isSelected[0]){
                                    DepAirport.setDurationFrom(1.toString());
                                    DepAirport.setDurationTo(3.toString());
                                  }
                                  if(isSelected[1]){
                                    DepAirport.setDurationFrom(4.toString());
                                    DepAirport.setDurationTo(7.toString());
                                  }
                                  if(isSelected[2]){
                                    DepAirport.setDurationFrom(8.toString());
                                    DepAirport.setDurationTo(14.toString());
                                  }
                                  

                                } else {
                                  isSelected[buttonIndex] = false;
                                }
                              }
                            });
                          },
                          
                        ),
                        
                        
                      ],
                    ),
 
                  ],
                ),
              ),
            ],
          );


    }else{

    return Container(
      child: Text(
        'Return'
      )
    );
  }

  }
}