
import 'address_data.dart';

class AddressModel {
  String? status;
  List<AddressData> data = [];

AddressModel();
  AddressModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = (json["data"] == null ? null : (json["data"] as List).map((e) => AddressData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> ata = <String, dynamic>{};
    ata["status"] = status;
    ata["data"] = data.map((e) => e.toJson()).toList();
    return ata;
  }
}
