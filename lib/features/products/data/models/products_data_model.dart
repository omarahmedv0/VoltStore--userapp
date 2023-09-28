
import 'products_data.dart';

class ProductsDataModel {
  String? status;
  List<ProductsData> products = [];

  ProductsDataModel({this.status,});

  ProductsDataModel.fromJson(Map<dynamic, dynamic> json) {
    status = json["status"];
    products = (json["products"] == null ? null : (json["products"] as List).map((e) => ProductsData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["products"] = products.map((e) => e.toJson()).toList();
    return data;
  }
}

