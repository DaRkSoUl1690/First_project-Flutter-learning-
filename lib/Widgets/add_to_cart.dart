import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f1/models/Catalog.dart';
import 'package:flutter_f1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class addtocart extends StatefulWidget {
  const addtocart({Key? key, required this.catalog}) : super(key: key);

  final Item catalog;

  @override
  _addtocartState createState() => _addtocartState();
}

class _addtocartState extends State<addtocart> {
  final _cart = cartModel();

  @override
  Widget build(BuildContext context) {
    bool isincart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isincart) {
            isincart = isincart.toggle();
            final catalog = CatalogModel();

            _cart.Catalog = catalog;
            _cart.add(widget.catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              context.theme.buttonColor,
            ),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isincart
            ? Icon(Icons.done)
            : Icon(CupertinoIcons.cart_fill_badge_plus));
  }
}
