import 'package:flutter/material.dart';
import 'package:flutter_f1/Widgets/Theme.dart';
import 'package:flutter_f1/models/Catalog.dart';
import 'package:flutter_f1/utils/MyRoutes.dart';
import 'package:velocity_x/velocity_x.dart';

class home_detail extends StatelessWidget {
  const home_detail({Key? key, required this.Catalog})
      : assert(Catalog != null),
        super(key: key);

  final Item Catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor:context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${Catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                    context.theme.buttonColor
                    ),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: "Buy".text.xl3.make()).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Catalog.id, child: Image.network(Catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    Catalog.name.text.xl4.color(context.accentColor).make(),
                    Catalog.desc.text.xl.color(Colors.grey).make(),
                    10.heightBox,
                    "Ipsum est labore et nonumy amet lorem sed, sed dolor sit diam sed, amet ea invidunt dolor invidunt. Tempor amet nonumy invidunt tempor rebum et. Est vero voluptua tempor est dolor dolor rebum, sanctus dolor consetetur ea consetetur magna, dolores ipsum eirmod magna diam, est sit ut labore eirmod sed.".text.sm.color(Colors.grey).make().p8()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
