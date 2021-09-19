import 'package:flutter/material.dart';
import 'package:flutter_f1/Core/Store.dart';
import 'package:flutter_f1/models/cart.dart';

import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartModel _cart = (VxState.store as Mystore).cart1;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         VxConsumer(
           notifications: {},
            mutations:{RemoveMutation},
            // ignore: non_constant_identifier_names
            builder: (context,dynamic,Vxstatus)
            {
               return "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.accentColor)
              .make();
            },
        ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     VxState.watch(context, on: [RemoveMutation]);
    final cartModel _cart = (VxState.store as Mystore).cart1;
    return _cart.items.isEmpty
        ? "nothing to  show ".text.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
