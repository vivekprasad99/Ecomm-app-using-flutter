import 'package:better_buys/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:better_buys/screens/sellers_screen.dart';
import 'package:better_buys/screens/product_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        SellersScreen.routeName: (_) => const SellersScreen(),
        ProductScreen.routeName : (_) => const ProductScreen(),
      },
    );
  }
}

