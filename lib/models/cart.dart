import 'package:flutter_f1/Core/Store.dart';
import 'package:flutter_f1/models/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class cartModel {
  late CatalogModel _catalogModel;
  final List<int> _itemids = [];

  CatalogModel get catalog => _catalogModel;

  set Catalog(CatalogModel newcatalog) {
    _catalogModel = newcatalog;
  }

  List<Item> get items =>
      _itemids.map((id) => _catalogModel.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void remove(Item item) {
    _itemids.remove(item.id);
  }
}

class AddMutation extends VxMutation<Mystore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart1._itemids.add(item.id);
  }
}
