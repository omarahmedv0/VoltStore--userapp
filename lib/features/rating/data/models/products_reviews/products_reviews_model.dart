
import 'products_reviews_data.dart';

class ProductsReviewsModel {
  String? status;
  String? message;
  int? avrgStars;
  String? countReviews;
  List<ProductsReviewsData> data = [];

  ProductsReviewsModel({this.status, this.message, this.avrgStars, this.countReviews,});

  ProductsReviewsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    avrgStars = json["avrg_stars"];
    countReviews = json["count_reviews"];
    data = (json["data"] == null ? null : (json["data"] as List).map((e) => ProductsReviewsData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["avrg_stars"] = avrgStars;
    _data["count_reviews"] = countReviews;
    _data["data"] = data.map((e) => e.toJson()).toList();
      return _data;
  }
}
