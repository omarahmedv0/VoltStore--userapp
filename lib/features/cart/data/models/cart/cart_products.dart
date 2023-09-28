
class CartProducts {
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
  String? cartId;
  String? cartUserid;
  String? cartProductid;
  String? productQuantity;
  String? productColor;
  String? productSize;
  String? cartOrders;
  String? productNewprice;
  String? countitems;
  String? totalprice;

  CartProducts({this.productId, this.productNameAr, this.productNameEn, this.productDescAr, this.productDescEn, this.productImage, this.productCount, this.productActive, this.productOldprice, this.productDescount, this.productTimeCreate, this.cartId, this.cartUserid, this.cartProductid, this.productQuantity, this.productColor, this.productSize, this.cartOrders, this.productNewprice, this.countitems, this.totalprice});

  CartProducts.fromJson(Map<String, dynamic> json) {
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
    cartId = json["cart_id"];
    cartUserid = json["cart_userid"];
    cartProductid = json["cart_productid"];
    productQuantity = json["product_quantity"];
    productColor = json["product_color"];
    productSize = json["product_size"];
    cartOrders = json["cart_orders"];
    productNewprice = json["product_newprice"];
    countitems = json["countitems"];
    totalprice = json["totalprice"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
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
    _data["cart_id"] = cartId;
    _data["cart_userid"] = cartUserid;
    _data["cart_productid"] = cartProductid;
    _data["product_quantity"] = productQuantity;
    _data["product_color"] = productColor;
    _data["product_size"] = productSize;
    _data["cart_orders"] = cartOrders;
    _data["product_newprice"] = productNewprice;
    _data["countitems"] = countitems;
    _data["totalprice"] = totalprice;
    return _data;
  }
}