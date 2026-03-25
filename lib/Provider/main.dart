import 'package:flutter/material.dart';
import 'package:getx_all/Provider/homeScreen.dart';
import 'package:getx_all/Provider/provider_class.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home:HomeScreen(),
      home:HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}