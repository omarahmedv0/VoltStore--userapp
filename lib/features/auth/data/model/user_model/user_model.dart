import 'user_data.dart';

class UserModel {
  String? status;
  String? message;
  UserData? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = UserData.fromJson(json['data'][0]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

