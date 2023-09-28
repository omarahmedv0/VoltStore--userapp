
class ProductSizeModel {
  String? status;
  String? message;
  String? productid;
  String? productSizId;
  List<String>? data;

  ProductSizeModel({this.status, this.message, this.productid, this.productSizId, this.data});

  ProductSizeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    productid = json["productid"];
    productSizId = json["product_siz_id"];
    data = json["data"] == null ? null : List<String>.from(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["productid"] = productid;
    _data["product_siz_id"] = productSizId;
    if(data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}