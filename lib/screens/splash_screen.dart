import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:better_buys/server_handler.dart';
import 'package:better_buys/screens/sellers_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoadingSellers = false;
  Timer? timer;

  void getSellers() {
    ServerHandler().getSellers().then((value) => Navigator.of(context).popAndPushNamed(SellersScreen.routeName,arguments: value).catchError((e) => print(e))); 
  }
  @override
  void initState() {
    
    super.initState();
    // initialize the timer
    timer = Timer(Duration(seconds: 5),()=>{
      setState(() {
      showLoadingSellers = true;
    }),
    getSellers(),
    });
  }
  @override
  void dispose() {
    // dispose the timer
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xffE6F3EC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Better Buys',style: GoogleFonts.pacifico(
              color: Color(0xff4E8489),
              fontSize: 27.0
            ),
            ),
            if(showLoadingSellers)
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4E8489)),
                strokeWidth: 1.5,
              ),
            ),
            if(showLoadingSellers)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Loading Sellers',style: GoogleFonts.poppins(),),
            ),
          ],
        ),
      ),
    );
  }
}