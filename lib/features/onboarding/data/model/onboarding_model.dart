
class OnboardingModel {
  String? status;
  String? message;
  List<Data>? data;

  OnboardingModel({this.status, this.message, this.data});

  OnboardingModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? pageId;
  String? titleEn;
  String? titleAr;
  String? bodyEn;
  String? bodyAr;
  String? image;

  Data({this.pageId, this.titleEn, this.titleAr, this.bodyEn, this.bodyAr, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    pageId = json["page_id"];
    titleEn = json["title_en"];
    titleAr = json["title_ar"];
    bodyEn = json["body_en"];
    bodyAr = json["body_ar"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page_id"] = pageId;
    _data["title_en"] = titleEn;
    _data["title_ar"] = titleAr;
    _data["body_en"] = bodyEn;
    _data["body_ar"] = bodyAr;
    _data["image"] = image;
    return _data;
  }
}