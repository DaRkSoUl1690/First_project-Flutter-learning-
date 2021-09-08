class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      color: map["color"],
      image: map["image"],
      name: map["name"],
      price: map["price"],
      desc: map["desc"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}

class CatalogModel {


 static final _catamodel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => _catamodel;

  static List<Item> products = [];

  // get item by id
 Item getById(int id) =>
      products.firstWhere((element) => element.id == id, orElse: null);

  // get itme by position

 Item getByPosition(int pos) => products[pos];
}
