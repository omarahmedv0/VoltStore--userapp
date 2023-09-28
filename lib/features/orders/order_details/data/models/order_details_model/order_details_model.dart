import '../../../../../address/data/models/address_model/address_data.dart';
import 'order_details_data.dart';
import 'product_details_data.dart';

class OrderDetailsModel {
  String? status;
  String? message;
  MyorderDetails? orderDetails;
  AddressData? addressDetails;
  List<ProductsDetailsMyorder>? productsDetails;

  OrderDetailsModel({this.status, this.message, this.orderDetails, this.addressDetails, this.productsDetails});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderDetails = json["order_details"] == null ? null : MyorderDetails.fromJson(json["order_details"]);
    addressDetails = json["address_details"] == null ? null : AddressData.fromJson(json["address_details"]);
    productsDetails = json["products_details"] == null ? null : (json["products_details"] as List).map((e) => ProductsDetailsMyorder.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(orderDetails != null) {
      _data["order_details"] = orderDetails?.toJson();
    }
    if(addressDetails != null) {
      _data["address_details"] = addressDetails?.toJson();
    }
    if(productsDetails != null) {
      _data["products_details"] = productsDetails?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
