class MyratingData {
  String? rateId;
  String? rateUserid;
  String? rateProductid;
  String? rateStar;
  String? rateComment;
  String? rateDate;
  String? productId;
  String? productNameAr;
  String? productNameEn;
  String? productDescAr;
  String? productDescEn;
  String? productImage;
  String? productCount;
  String? productActive;
  String? productOldprice;
  String? productDescount;
  String? productTimeCreate;

  MyratingData({this.rateId, this.rateUserid, this.rateProductid, this.rateStar, this.rateComment, this.rateDate, this.productId, this.productNameAr, this.productNameEn, this.productDescAr, this.productDescEn, this.productImage, this.productCount, this.productActive, this.productOldprice, this.productDescount, this.productTimeCreate});

  MyratingData.fromJson(Map<String, dynamic> json) {
    rateId = json["rate_id"];
    rateUserid = json["rate_userid"];
    rateProductid = json["rate_productid"];
    rateStar = json["rate_star"];
    rateComment = json["rate_comment"];
    rateDate = json["rate_date"];
    productId = json["product_id"];
    productNameAr = json["product_name_ar"];
    productNameEn = json["product_name_en"];
    productDescAr = json["product_desc_ar"];
    productDescEn = json["product_desc_en"];
    productImage = json["product_image"];
    productCount = json["product_count"];
    productActive = json["product_active"];
    productOldprice = json["product_oldprice"];
    productDescount = json["product_descount"];
    productTimeCreate = json["product_time_create"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rate_id"] = rateId;
    _data["rate_userid"] = rateUserid;
    _data["rate_productid"] = rateProductid;
    _data["rate_star"] = rateStar;
    _data["rate_comment"] = rateComment;
    _data["rate_date"] = rateDate;
    _data["product_id"] = productId;
    _data["product_name_ar"] = productNameAr;
    _data["product_name_en"] = productNameEn;
    _data["product_desc_ar"] = productDescAr;
    _data["product_desc_en"] = productDescEn;
    _data["product_image"] = productImage;
    _data["product_count"] = productCount;
    _data["product_active"] = productActive;
    _data["product_oldprice"] = productOldprice;
    _data["product_descount"] = productDescount;
    _data["product_time_create"] = productTimeCreate;
    return _data;
  }
}