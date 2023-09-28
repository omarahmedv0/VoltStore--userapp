

import 'order_data.dart';

class OrderModel {
  String? status;
  String? message;
  List<OrderData> orderData = [];
OrderModel();

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderData = (json["data"] == null ? null : (json["data"] as List).map((e) => OrderData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["data"] = orderData.map((e) => e.toJson()).toList();
      return _data;
  }
}