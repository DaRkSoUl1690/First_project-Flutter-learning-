import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f1/Core/Store.dart';
import 'package:flutter_f1/models/Catalog.dart';
import 'package:flutter_f1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class addtocart extends StatelessWidget {
  final Item cata;
  addtocart({Key? key, required this.cata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final cartModel _cart = (VxState.store as Mystore).cart1;

    bool isincart = _cart.items.contains(cata);
    return ElevatedButton(
        onPressed: () {
          if (!isincart) {
            AddMutation(cata);
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
