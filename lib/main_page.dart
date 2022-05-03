import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ryanairapp/api/test_api.dart';


class Main_Page extends StatefulWidget {
  const Main_Page({ Key? key }) : super(key: key);

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {

  bool hasInternet = false;



  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(246, 137, 21,1),
          leading: ImageIcon(
                AssetImage('assets/logo.png'),
              ),
          leadingWidth: 40.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ImageIcon(
              //   AssetImage('assets/logo.png'),
              //   size: 30.0,


              // ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'CheapFly by Tourero'
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      // color: Color.fromRGBO(246, 137, 21,1),
                      child: Column(
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Container(
                              height: 80.0,
                              child: Image.asset(
                                'assets/logo_white.png',
                                fit: BoxFit.contain,
                                ),
                              ),
                          ),
                            
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cheap',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(246, 137, 21,1),
                                ),
                              ),
                              Text(
                                'Fly',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(32, 145, 235,1)
                                ),
                              ),
                            ],
                          ),
                          
                          Text(
                            'by Tourero',
                            style: TextStyle(
                              color: Color.fromRGBO(246, 137, 21,1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:10.0, bottom: 10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'The Cheaper...',
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(246, 137, 21,1),
                                        ),
                                      ),
                                  Text(
                                    'the Better!',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(32, 145, 235,1),
                                    ),
                                  ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Search the cheapest flights',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                                Text(
                                  ' for your next holiday!',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),
                  
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        color: Color.fromRGBO(7, 53, 144, 1),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Column(
                            children: [
                              Text(
                                'Fly with RYANAIR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ElevatedButton(
                                  onPressed: () async{
                                    // Navigator.pushReplacementNamed(context, '/homeRyanair');
                                    hasInternet = await InternetConnectionChecker().hasConnection;

                                      if(hasInternet){
                                        Navigator.pushReplacementNamed(context, '/homeRyanair');
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
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(241, 201, 51, 1)),
                                    
                                  ),
                                  child: Text(
                                    'Search the Cheapest',
                                    style: TextStyle(
                                      color: Color.fromRGBO(7, 53, 144, 1)
                                    ),
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
              ),
             
              
            ],
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