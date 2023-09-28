import '../../../../address/data/models/address_model/address_data.dart';

class OrderData extends AddressData {
  String? orderId;
  String? orderAddressid;
  String? orderUserid;
  String? orderDeliveryprice;
  String? orderSubprice;
  String? orderTotalprice;
  String? orderDiscount;
  String? orderStatus;
  String? orderCouponid;
  String? orderPaymentmethod;
  String? orderDatetime;

  OrderData.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    orderAddressid = json["order_addressid"];
    orderUserid = json["order_userid"];
    orderDeliveryprice = json["order_deliveryprice"];
    orderSubprice = json["order_subprice"];
    orderTotalprice = json["order_totalprice"];
    orderStatus = json["status"];
    orderDiscount = json["order_discount"];
    orderCouponid = json["order_couponid"];
    orderPaymentmethod = json["order_paymentmethod"];
    orderDatetime = json["order_datetime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    _data["order_id"] = orderId;
    _data["order_addressid"] = orderAddressid;
    _data["order_userid"] = orderUserid;
    _data["order_deliveryprice"] = orderDeliveryprice;
    _data["order_subprice"] = orderSubprice;
    _data["order_totalprice"] = orderTotalprice;
    _data["status"] = orderStatus;
    _data["order_couponid"] = orderCouponid;
    _data["order_paymentmethod"] = orderPaymentmethod;
    _data["order_datetime"] = orderDatetime;

    return _data;
  }
}
