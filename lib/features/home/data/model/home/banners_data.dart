class BannersData {
  String? bannerId;
  String? bannerImage;

  BannersData({this.bannerId, this.bannerImage});

  BannersData.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_id'] = this.bannerId;
    data['banner_image'] = this.bannerImage;
    return data;
  }
}