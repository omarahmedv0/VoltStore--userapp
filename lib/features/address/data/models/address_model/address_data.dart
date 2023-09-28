
class AddressData {
 String? addressNo;
  String? addressUserid;
  String? addressName;
  String? cityId;
  String? addressStreet;
  String? additionalDetails;
  String? addressPhoneNumber;
  String? addressLat;
  String? addressLong;
  String? cityNameEn;
  String? cityNameAr;

  AddressData({this.addressNo, this.addressUserid, this.addressName, this.cityId, this.addressStreet, this.additionalDetails, this.addressPhoneNumber, this.addressLat, this.addressLong, this.cityNameEn, this.cityNameAr});

  AddressData.fromJson(Map<String, dynamic> json) {
    addressNo = json["address_no"];
    addressUserid = json["address_userid"];
    addressName = json["address_name"];
    cityId = json["city_id"];
    addressStreet = json["address_street"];
    additionalDetails = json["additional_details"];
    addressPhoneNumber = json["address_phone_number"];
    addressLat = json["address_lat"];
    addressLong = json["address_long"];
    cityNameEn = json["city_name_en"];
    cityNameAr = json["city_name_ar"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address_no"] = addressNo;
    _data["address_userid"] = addressUserid;
    _data["address_name"] = addressName;
    _data["city_id"] = cityId;
    _data["address_street"] = addressStreet;
    _data["additional_details"] = additionalDetails;
    _data["address_phone_number"] = addressPhoneNumber;
    _data["address_lat"] = addressLat;
    _data["address_long"] = addressLong;
    _data["city_name_en"] = cityNameEn;
    _data["city_name_ar"] = cityNameAr;
    return _data;
  }
}