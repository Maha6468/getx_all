import 'package:flutter/material.dart';
import 'package:getx_all/Provider/changeNotifier/provider_class.dart';
import 'package:getx_all/Provider/changeNotifier/todoProvider.dart';
import 'package:getx_all/Provider/screen/homeScreen.dart';
import 'package:getx_all/Provider/screen/todoScreen.dart';
import 'package:provider/provider.dart';



void main() {
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (_) => CounterProvider(),
  //     child: MyApp(),
  //   ),);
  // runApp(MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home:HomeScreen(),
      home: TodoScreen(),

      // home: ChangeNotifierProvider(
      //   create: (_) => CounterProvider(),
      //   child:HomeScreen(),),

      // home: ChangeNotifierProvider(
      //   create: (_) => CounterProvider(),
      //   child:TodoScreen(),),

      debugShowCheckedModeBanner: false,

    );
  }
}