
import 'favorite_data.dart';

class FavoriteModel {
  String? status;
  String? message;
  List<FavoriteProductsData> favorite =[];

  FavoriteModel({this.status, this.message, });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    favorite = (json["data"] == null ? null : (json["data"] as List).map((e) => FavoriteProductsData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    data["data"] = favorite.map((e) => e.toJson()).toList();
    return data;
  }
}
