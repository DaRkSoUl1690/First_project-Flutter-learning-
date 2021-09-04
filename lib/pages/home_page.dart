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
    var productsJSON =
        await rootBundle.loadString("assets/files/products.JSON");
    var decode = jsonDecode(productsJSON);
    var productsData = decode["products"];
    
  }

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(10, (index) => CatalogModel.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("catalog app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
