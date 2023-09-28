class CartData {
  String countitems = '0';
  String subCartprice = '0';

CartData();
  CartData.fromJson(Map<String, dynamic> json) {
    countitems = json["countitems"];
    subCartprice = json["subCartprice"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["countitems"] = countitems;
    _data["subCartprice"] = subCartprice;
    return _data;
  }
}
