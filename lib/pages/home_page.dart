import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_f1/Widgets/drawer.dart';
import 'package:flutter_f1/Widgets/item_widget.dart';
import 'package:flutter_f1/models/Catalog.dart';

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
      appBar: AppBar(
        title: Text("catalog app"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.products != null &&
                  CatalogModel.products.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.products.length,
                  itemBuilder: (context, index) => ItemWidget(
                      item: CatalogModel.products[index],
                    ),
                  
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: Mydrawer(),
    );
  }
}
