import 'package:aprilskuisine/model/product_model.dart';

class CartModel {
  int? id;
  String? name;

  int? price;
  int? quantity;
  bool? isExist;
  String? time;
  String? img;
  ProductModel? product;

  CartModel(
      {this.name,
      this.price,
      this.img,
      this.id,
      this.time,
      this.quantity,
      this.isExist,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "img": img,
      "quantity": quantity,
      "isExist": isExist,
      "time": time,
      "product":product!.toJson()
    };
  }
}
