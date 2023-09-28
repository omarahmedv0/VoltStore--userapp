
import 'cart_data.dart';
import 'cart_products.dart';

class CartModel {
  String? status;
  String? message;
  Data data = Data();

  CartModel({this.status, this.message, });

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = (json["data"] == null ? null : Data.fromJson(json["data"]))!;
  }

}

class Data {
  List<CartProducts> cartProducts = [];
  CartData cartData=CartData();

Data();
  Data.fromJson(Map<String, dynamic> json) {
    cartProducts = (json["cart_products"] == null ? null : (json["cart_products"] as List).map((e) => CartProducts.fromJson(e)).toList())!;
    cartData = (json["cart_data"] == null ? null : CartData.fromJson(json["cart_data"]))!;
  }


}

