import 'banners_data.dart';
import 'categories_data.dart';
import 'popular_products.dart';

class HomeDataModel {
  String? status;
  String? message;
  List<Categories> categories = [];
  List<BannersData> banners = [];
  List<PopularProductsModel> popular = [];

  HomeDataModel({
    this.status,
    this.message,
  });

  HomeDataModel.fromJson(Map<dynamic, dynamic> json) {
    status = json["status"];
    message = json["message"];
    categories = (json["categories"] == null
        ? null
        : (json["categories"] as List)
            .map((e) => Categories.fromJson(e))
            .toList())!;
    banners = (json["banners"] == null
        ? null
        : (json["banners"] as List)
            .map((e) => BannersData.fromJson(e))
            .toList())!;

    popular = (json["popular"] == null
        ? null
        : (json["popular"] as List)
            .map((e) => PopularProductsModel.fromJson(e))
            .toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    data["categories"] = categories.map((e) => e.toJson()).toList();
    data["products"] = popular.map((e) => e.toJson()).toList();
    return data;
  }
}
