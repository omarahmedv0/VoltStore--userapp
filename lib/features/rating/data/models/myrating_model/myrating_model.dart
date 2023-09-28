
import 'myrating_data.dart';

class MyratingModel {
  String? status;
  String? message;
  List<MyratingData> data = [];

  MyratingModel({this.status, this.message, });

  MyratingModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = (json["data"] == null ? null : (json["data"] as List).map((e) => MyratingData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> ata = <String, dynamic>{};
    ata["status"] = status;
    ata["message"] = message;
    ata["data"] = data.map((e) => e.toJson()).toList();
      return ata;
  }
}

