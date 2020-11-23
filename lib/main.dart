import 'package:financial_app/screen/Dashboard/Dashboard.dart';
import 'package:financial_app/screen/LoginPage/LoginPage.dart';
import 'package:financial_app/screen/LoginPage2/LoginPage2.dart';
import 'package:financial_app/screen/ToDoList/ToDoList.dart';
import 'package:financial_app/screen/home_page/HomePage2WithSideBar.dart';
import 'package:financial_app/screen/home_page/home_page.dart';
import 'package:financial_app/screen/splash_screen/SplashScreen2.dart';
import 'package:financial_app/screen/splash_screen/splash_screen.dart';
import 'package:financial_app/theme/style.dart';
import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: bgColor,
        // primarySwatch: Colors.blue,
        fontFamily: 'Khang',
      ),
      home: SplashScreen2(),
      routes: {
        'financial2': (context) => HomePage2WithSideBar(),
        'dashboard': (context) => Dashboard(),
        'todolist': (context) => ToDoList(),
      },
    );
  }
}
