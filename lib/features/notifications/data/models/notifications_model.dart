
import 'notifications_data.dart';

class NotificationsModel {
  String? status;
  String? message;
  List<NotificationsData> data = [];

  NotificationsModel({this.status, this.message,});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = (json["data"] == null ? null : (json["data"] as List).map((e) => NotificationsData.fromJson(e)).toList())!;
  }

}
