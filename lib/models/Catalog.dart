class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name,required  this.desc,required  this.price,required  this.color,required  this.image});
}



class CatalogModel{
      
    static  final products = [
  Item(id:1, name:"iphone 12", desc:"apple iphone pro 12 generation", price:999, color:"white", image:"https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-pro-family-hero?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1604021663000")
    
];
}