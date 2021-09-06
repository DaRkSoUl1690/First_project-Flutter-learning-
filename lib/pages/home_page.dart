import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_f1/Widgets/Theme.dart';
// ignore: unused_import
import 'package:flutter_f1/Widgets/drawer.dart';
import 'package:flutter_f1/Widgets/home_widgets/catalog_header.dart';
import 'package:flutter_f1/Widgets/home_widgets/catalog_list.dart';
// ignore: unused_import
import 'package:flutter_f1/Widgets/item_widget.dart';
import 'package:flutter_f1/models/Catalog.dart';
import 'package:flutter_f1/pages/cart_page.dart';
import 'package:flutter_f1/utils/MyRoutes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    final productsJSON =
        await rootBundle.loadString("assets/files/products.JSON");
    var decode = jsonDecode(productsJSON);
    var productsData = decode["products"];
    CatalogModel.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
      child: Icon(CupertinoIcons.cart),),
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalogheader(),
            if (CatalogModel.products != null &&
                CatalogModel.products.isNotEmpty)
              CatalogList().py16().expand()
            else
              CircularProgressIndicator().centered().expand()
          ],
        ),
      ),
    ));
  }
}
