import 'package:gut7/models/models.dart';
import 'package:gut7/screens/components/components.dart';

class Product {
  int id;
  String name;
  int categoryId;
  int price;
  String image;
  String model;
  String description;
  String rating;
  int countRate;
  int active;
  String createdAt;
  String updatedAt;
  Category category;

  Product(
      {this.id,
        this.name,
        this.categoryId,
        this.price,
        this.image,
        this.model,
        this.description,
        this.rating,
        this.countRate,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    price = json['price'];
    image = Globals().urlImage + json['image'];
    model = json['model'];
    description = json['description'];
    rating = json['rating'];
    countRate = json['count_rate'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['image'] = this.image;
    data['model'] = this.model;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['count_rate'] = this.countRate;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}