import '../../../../core/models/products.dart';

class FavoriteProductsData extends Products {
  String? favId;
  String? favUserid;
  String? favProductid;
  String? userId;

  FavoriteProductsData.fromJson(Map<String, dynamic> json) {
    favId = json["fav_id"];
    favUserid = json["fav_userid"];
    favProductid = json["fav_productid"];
    productId = json["product_id"];
    productNameAr = json["product_name_ar"];
    productNameEn = json["product_name_en"];
    productDescAr = json["product_desc_ar"];
    productDescEn = json["product_desc_en"];
    productImage = json["product_image"];
    productCount = json["product_count"];
    productActive = json["product_active"];
    productOldPrice = json["product_oldprice"];
    productNewPrice = json['product_newprice'];
    productDiscount = json["product_descount"];
    productTimeCreate = json["product_time_create"];
    userId = json["user_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["fav_id"] = favId;
    data["fav_userid"] = favUserid;
    data["fav_productid"] = favProductid;
    data["product_id"] = productId;
    data["product_name_ar"] = productNameAr;
    data["product_name_en"] = productNameEn;
    data["product_desc_ar"] = productDescAr;
    data["product_desc_en"] = productDescEn;
    data["product_image"] = productImage;
    data["product_count"] = productCount;
    data["product_active"] = productActive;
    data["product_oldprice"] = productOldPrice;
    data["product_newprice"] = productOldPrice;

    data["product_descount"] = productDiscount;
    data["product_time_create"] = productTimeCreate;
    data["user_id"] = userId;
    return data;
  }
}
