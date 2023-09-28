class NotificationsData {
  String? notificationsId;
  String? notificationsUserid;
  String? notificationsTitleEn;
  String? notificationsBodyEn;
  String? notificationsTitleAr;
  String? notificationsBodyAr;
  String? notificationsImage;
  String? notificationsDatetime;

  NotificationsData(
      {this.notificationsId,
      this.notificationsUserid,
      this.notificationsTitleEn,
      this.notificationsBodyEn,
      this.notificationsImage,
      this.notificationsDatetime});

  NotificationsData.fromJson(Map<String, dynamic> json) {
    notificationsId = json["notifications_id"];
    notificationsUserid = json["notifications_userid"];
    notificationsTitleEn = json["notifications_title_en"];
    notificationsBodyEn = json["notifications_body_en"];
    notificationsTitleAr = json["notifications_title_ar"];
    notificationsBodyAr = json["notifications_body_ar"];
    notificationsImage = json["notifications_image"];
    notificationsDatetime = json["notifications_datetime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["notifications_id"] = notificationsId;
    _data["notifications_userid"] = notificationsUserid;
    _data["notifications_title"] = notificationsTitleEn;
    _data["notifications_body"] = notificationsBodyEn;
    _data["notifications_image"] = notificationsImage;
    _data["notifications_datetime"] = notificationsDatetime;
    return _data;
  }
}
