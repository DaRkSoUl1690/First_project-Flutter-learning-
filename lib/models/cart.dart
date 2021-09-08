import 'package:flutter_f1/models/Catalog.dart';

class cartModel {
  static final _cartModel = cartModel._internal();

  cartModel._internal();

  factory cartModel() => cartModel();

  late CatalogModel _catalogModel;
  final List<int> _itemids = [];

  CatalogModel get catalog => _catalogModel;

  set Catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalogModel = newcatalog;
  }

  List<Item> get items =>
      _itemids.map((id) => _catalogModel.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemids.add(item.id);
  }

  void remove(Item item) {
    _itemids.remove(item.id);
  }
}
