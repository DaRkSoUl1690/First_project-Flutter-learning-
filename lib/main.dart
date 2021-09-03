import 'package:flutter/material.dart';
import 'package:flutter_f1/Widgets/Theme.dart';
import 'package:flutter_f1/pages/home_page.dart';
import 'package:flutter_f1/pages/login_page.dart';
import 'package:flutter_f1/utils/MyRoutes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/login",
      routes: {
        "/": (context) => new loginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        "/login": (context) => new loginPage()
      },
    );
  }
}
