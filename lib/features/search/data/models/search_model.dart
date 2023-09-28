
import 'search_product_data.dart';

class SearchModel {
  String? status;
  String? message;
  List<SearchProductData> data = [];

  SearchModel({this.status, this.message,});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = (json["data"] == null ? null : (json["data"] as List).map((e) => SearchProductData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> ata = <String, dynamic>{};
    ata["status"] = status;
    ata["message"] = message;
    ata["data"] = data.map((e) => e.toJson()).toList();
    return ata;
  }
}
