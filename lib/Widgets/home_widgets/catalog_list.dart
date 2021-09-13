import 'package:flutter/material.dart';
import 'package:flutter_f1/Widgets/Theme.dart';
import 'package:flutter_f1/models/Catalog.dart';
import 'package:flutter_f1/models/cart.dart';
import 'package:flutter_f1/pages/home_detail.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //  shrinkWrap: true,
      itemCount: CatalogModel.products.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.products[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => HomeDetailPage(catalog: catalog))),
            child: catalogItem(catalog: catalog));
      },
    );
  }
}

class catalogItem extends StatelessWidget {
  const catalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: catalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.accentColor).make(),
            catalog.desc.text.sm.color(Colors.grey).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                addtocart(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

class addtocart extends StatefulWidget {
  final Item catalog;

  const addtocart({Key? key, required this.catalog}) : super(key: key);

  @override
  _addtocartState createState() => _addtocartState();
}

class _addtocartState extends State<addtocart> {
  bool isadded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isadded = isadded.toggle();
          final catalog = CatalogModel();

          final _cart = cartModel();
          _cart.Catalog = catalog;
          _cart.add(widget.catalog);
          // setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              context.theme.buttonColor,
            ),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isadded ? Icon(Icons.done) : "Add to Cart".text.make());
  }
}

class catalogImage extends StatelessWidget {
  const catalogImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w32(context);
  }
}
