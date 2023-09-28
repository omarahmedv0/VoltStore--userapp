class UserData {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userPassword;
  String? userVerfiycode;
  String? userApprove;
  String? userTimecreate;
  String? userImage;

  UserData(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userPassword,
      this.userVerfiycode,
      this.userApprove,
      this.userTimecreate});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userPassword = json['user_password'];
    userVerfiycode = json['user_verfiycode'];
    userApprove = json['user_approve'];
    userTimecreate = json['user_timecreate'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_phone'] = userPhone;
    data['user_password'] = userPassword;
    data['user_verfiycode'] = userVerfiycode;
    data['user_approve'] = userApprove;
    data['user_timecreate'] = userTimecreate;
    return data;
  }
}
