
class ProductColorsModel {
  String? status;
  String? message;
  String? productid;
  String? productColorId;
  List<String>? data;

  ProductColorsModel({this.status, this.message, this.productid, this.productColorId, this.data});

  ProductColorsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    productid = json["productid"];
    productColorId = json["product_color_id"];
    data = json["data"] == null ? null : List<String>.from(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["productid"] = productid;
    _data["product_color_id"] = productColorId;
    if(data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}