// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
    Product({
        required this.avaible,
        required this.name,
        this.picture,
        required this.price,
        this.id
    });

    bool avaible;
    String name;
    String? picture;
    double price;
    String? id;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        avaible: json["avaible"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "avaible": avaible,
        "name": name,
        "picture": picture,
        "price": price,
    };

    Product copy()=>Product(
      avaible: avaible, 
      name: name,
      picture: picture, 
      price: price,
      id: id);
}