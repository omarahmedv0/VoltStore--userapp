
class ShippingCostModel {
  String? status;
  String? message;
  Data? data;

  ShippingCostModel({this.status, this.message, this.data});

  ShippingCostModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? shippingCost;

  Data({this.shippingCost});

  Data.fromJson(Map<String, dynamic> json) {
    shippingCost = json["shipping_cost"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["shipping_cost"] = shippingCost;
    return _data;
  }
}