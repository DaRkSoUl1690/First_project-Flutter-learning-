import 'package:flutter_f1/models/Catalog.dart';
import 'package:flutter_f1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  late CatalogModel cata_log;
  late cartModel cart1;

  Mystore() {
    cata_log = CatalogModel();
    cart1 = cartModel();
    cart1.Catalog = cata_log;
  }
}
