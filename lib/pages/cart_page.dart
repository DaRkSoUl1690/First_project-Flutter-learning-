import 'package:flutter/material.dart';
import 'package:flutter_f1/Widgets/Theme.dart';
import 'package:velocity_x/velocity_x.dart';

class cartPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       title: "Cart".text.make(),
     ),
     backgroundColor: MyTheme.creamColor,       
    );
  }
}