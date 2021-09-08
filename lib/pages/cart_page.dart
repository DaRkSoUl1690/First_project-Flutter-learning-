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
      body: Column(
        children: [
          cartlist().p32().expand(),
          Divider(),
          cartTotal(),
        ],
      ),
    );
  }
}

class cartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: "Buying not supported".text.make()));
                  },
                  child: "BUY".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}

class cartlist extends StatefulWidget {
  const cartlist({Key? key}) : super(key: key);

  @override
  _cartlistState createState() => _cartlistState();
}

class _cartlistState extends State<cartlist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(Icons.remove_circle_outline)),
              title: "Item 1".text.make(),
            ));
  }
}
