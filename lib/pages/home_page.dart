import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_f1/Core/Store.dart';
import 'package:flutter_f1/Widgets/home_widgets/catalog_header.dart';
import 'package:flutter_f1/Widgets/home_widgets/catalog_list.dart';
import 'package:flutter_f1/models/Catalog.dart';
import 'package:flutter_f1/models/cart.dart';
import 'package:flutter_f1/utils/MyRoutes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    // final productsJSON =
    //     await rootBundle.loadString("assets/files/products.JSON");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as Mystore).cart1;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, dynamic, Vxstatus) => FloatingActionButton(
            backgroundColor: context.theme.buttonColor,
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(color: Vx.red500, size: 20, count: _cart.items.length),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalogheader(),
                if (CatalogModel.products.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}
