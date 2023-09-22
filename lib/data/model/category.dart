import 'package:wahid/core/constant/image_assets.dart';

class CategoryModel {
  int? catId;
  //String? thumbnail;
  String? name;
  String? description;
  String? image;
  String? playlist;
  String? categoriesDatetime;

  CategoryModel({
    this.catId,
    this.name,
    this.playlist,
    this.description,
    this.image,
    this.categoriesDatetime,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    catId = json['categorie_id'];
    name = json['categories_name'];
    description = json['categorie_description'];
    playlist = json['playList'];
    image = json['categorie_image'];
    categoriesDatetime = json['categorie_datetime'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categorie_id'] = this.catId;
    data['categories_name'] = this.name;
    data['categorie_description'] = this.description;
    print("desc = ${data['categorie_description']}");
    data['playList'] = this.playlist;
    data['categorie_image'] = this.image;
    data['categorie_datetime'] = this.categoriesDatetime;
    return data;
  }
  // List<Category> categoryList = [
  //   Category(name: "الألوان", thumbnail: AppImageAsset.color, playlist: ''),
  //   Category(name: "الحروف العربية", thumbnail: AppImageAsset.alphabit, playlist: '')
  // ];
}
