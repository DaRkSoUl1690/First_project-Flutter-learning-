import 'package:flutter/material.dart';
import 'package:flutter_f1/Core/Store.dart';

import 'package:flutter_f1/Widgets/Theme.dart';
import 'package:flutter_f1/pages/cart_page.dart';
import 'package:flutter_f1/pages/home_page.dart';
import 'package:flutter_f1/pages/login_page.dart';
import 'package:flutter_f1/utils/MyRoutes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: Mystore(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,

      //  darkTheme: MyTheme.darkTheme(context),
      initialRoute:MyRoutes.homeRoute,
      routes: {
        "/": (context) => new loginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        "/login": (context) => new loginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
