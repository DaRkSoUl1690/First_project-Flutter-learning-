import 'package:flutter/material.dart';
import 'package:flutter_f1/pages/home_page.dart';
import 'package:flutter_f1/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      // themeMode: ThemeMode.light,
      // theme: ThemeData(primarySwatch: Colors.teal),
      // darkTheme:
      //     ThemeData(brightness: Brightness.light, primarySwatch: Colors.red),
      initialRoute: "/",
      routes: {
        "/": (context) => new loginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => new loginPage()
      },
    );
  }
}
