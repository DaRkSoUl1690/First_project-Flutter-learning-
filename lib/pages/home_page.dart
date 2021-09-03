import 'package:flutter/material.dart';
import 'package:flutter_f1/Widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("catalog app"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to the flutter"),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
