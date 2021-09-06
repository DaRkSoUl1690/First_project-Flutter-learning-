import 'package:flutter/cupertino.dart';
import 'package:flutter_f1/Widgets/Theme.dart';
import 'package:velocity_x/velocity_x.dart';

class catalogheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkbulishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}
