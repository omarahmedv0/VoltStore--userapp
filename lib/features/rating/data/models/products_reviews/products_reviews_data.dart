
class ProductsReviewsData {
  String? rateId;
  String? rateUserid;
  String? rateProductid;
  String? rateStar;
  String? rateComment;
  String? rateDate;
  String? userId;
  String? userName;
    String? userImage;

  String? userEmail;
  String? sumStars;
  String? countReview;

  ProductsReviewsData({this.rateId, this.rateUserid, this.rateProductid, this.rateStar, this.rateComment, this.rateDate, this.userId, this.userName, this.userEmail, this.sumStars, this.countReview});

  ProductsReviewsData.fromJson(Map<String, dynamic> json) {
    rateId = json["rate_id"];
    rateUserid = json["rate_userid"];
    rateProductid = json["rate_productid"];
    rateStar = json["rate_star"];
    rateComment = json["rate_comment"];
    rateDate = json["rate_date"];
    userId = json["user_id"];
    userName = json["user_name"];
    userEmail = json["user_email"];
    sumStars = json["sum_stars"];
        userImage = json["user_image"];

    countReview = json["count_review"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rate_id"] = rateId;
    _data["rate_userid"] = rateUserid;
    _data["rate_productid"] = rateProductid;
    _data["rate_star"] = rateStar;
    _data["rate_comment"] = rateComment;
    _data["rate_date"] = rateDate;
    _data["user_id"] = userId;
    _data["user_name"] = userName;
    _data["user_email"] = userEmail;
    _data["sum_stars"] = sumStars;
    _data["count_review"] = countReview;
    return _data;
  }
}