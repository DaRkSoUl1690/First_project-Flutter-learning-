import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class cartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).make(),
      ),
      backgroundColor: context.canvasColor,
    );
  }
}
