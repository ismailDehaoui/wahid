/*
  class CategoriesModel {
    String? cat_id;
    String? cat_name;
    String? cat_discreption;
    String? cat_image;
    String? cat_dateTime;

    CategoriesModel(
        {this.cat_id,
        this.cat_name,
        this.cat_discreption,
        this.cat_image,
        this.cat_dateTime});

    CategoriesModel.fromJson(Map<String, dynamic> json) {
      cat_id = json['categorie_id'];
      cat_id = json['categories_name'];
      cat_id = json['categorie_description'];
      cat_id = json['categorie_image'];
      cat_id = json['categorie_datetime'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['categorie_id'] = this.cat_id;
      data['categories_name'] = this.cat_name;
      data['categorie_description'] = this.cat_discreption;
      data['categorie_image'] = this.cat_image;
      data['categorie_datetime'] = this.cat_dateTime;
      return data;
    }
  }
*/
class CoursModel {
  final String id;
  final String title;
  final String thumbnailUrl;

  CoursModel(
      {required this.id, required this.title, required this.thumbnailUrl});
}
