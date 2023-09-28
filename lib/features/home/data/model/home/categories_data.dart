class Categories {
  String? categoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  String? image;
  String? categoryTimeCreate;

  Categories(
      {this.categoryId,
      this.categoryNameAr,
      this.categoryNameEn,
      this.image,
      this.categoryTimeCreate});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryNameAr = json['category_name_ar'];
    categoryNameEn = json['category_name_en'];
    image = json['image'];
    categoryTimeCreate = json['category_time_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name_ar'] = categoryNameAr;
    data['category_name_en'] = categoryNameEn;
    data['image'] = image;
    data['category_time_create'] = categoryTimeCreate;
    return data;
  }
}