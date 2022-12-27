class ProductModel{
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  ProductModel({this.id,this.title,this.price,this.category,this.description,this.image});
  factory ProductModel.fromJson(Map<String, dynamic> json){
    var p=ProductModel(
      id: json['id'],
      title: json['title'],
      price:json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
    return p;
  }
}