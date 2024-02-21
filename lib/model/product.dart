class Product{
  String name;
  String price;
  String color;
  int count;
  String image;

  Product(this.name, this.price, this.color, this.count, this.image);
}

List<Product> productList = [
  Product("item1", "\$32", "blue", 0, "assets/images/f1.png"),
  Product("item2", "\$32", "blue", 0, "assets/images/f2.png"),
  Product("item3", "\$32", "blue", 0, "assets/images/f3.png"),
  Product("item4", "\$32", "blue", 0, "assets/images/f4.png"),
  Product("item5", "\$32", "blue", 0, "assets/images/f5.png"),
  Product("item6", "\$32", "blue", 0, "assets/images/f6.png"),
  Product("item7", "\$32", "blue", 0, "assets/images/f7.png"),
];