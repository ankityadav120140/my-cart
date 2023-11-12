import 'package:get/get.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String imgPath;
  final double rating;

  Product(
    this.id,
    this.name,
    this.price,
    this.imgPath,
    this.rating,
  );
  var isFavorite = false.obs;

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        name = json["name"] ?? "Item",
        price = double.parse(json["price"]),
        imgPath = json["image_link"] ??
            "https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_1280.png",
        rating = json["rating"] ?? 5.0;
}
