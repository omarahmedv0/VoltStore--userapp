
class RatingModel {
  String? status;
  String? message;
  List<Data> data=[];

  RatingModel({this.status, this.message, });

  RatingModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = (json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;

      _data["data"] = data.map((e) => e.toJson()).toList();
    
    return _data;
  }
}

class Data {
  String? rateId;
  String? rateUserid;
  String? rateProductid;
  String? rateStar;
  String? rateComment;
  String? rateDate;

  Data({this.rateId, this.rateUserid, this.rateProductid, this.rateStar, this.rateComment, this.rateDate});

  Data.fromJson(Map<String, dynamic> json) {
    rateId = json["rate_id"];
    rateUserid = json["rate_userid"];
    rateProductid = json["rate_productid"];
    rateStar = json["rate_star"];
    rateComment = json["rate_comment"];
    rateDate = json["rate_date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rate_id"] = rateId;
    _data["rate_userid"] = rateUserid;
    _data["rate_productid"] = rateProductid;
    _data["rate_star"] = rateStar;
    _data["rate_comment"] = rateComment;
    _data["rate_date"] = rateDate;
    return _data;
  }
}