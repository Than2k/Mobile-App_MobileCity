class CategoryModel {
  String? name;

  CategoryModel({this.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var p = CategoryModel(
      name: json['name'],
    );
    return p;
  }
}
