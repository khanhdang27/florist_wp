/*
import 'package:florist/models/models.dart';
import 'package:florist/screens/components/components.dart';

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
}*/
import 'package:florist/models/models.dart';

class Product {
  int id;
  String name;
  String slug;
  String dateCreated;
  String dateModified;
  String status;
  bool featured;
  String description;
  String price;
  String regularPrice;
  String salePrice;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<Category> categories;
  List<Images> images;

  Product(
      {this.id,
        this.name,
        this.slug,
        this.dateCreated,
        this.dateModified,
        this.status,
        this.featured,
        this.description,
        this.price,
        this.regularPrice,
        this.salePrice,
        this.onSale,
        this.purchasable,
        this.totalSales,
        this.reviewsAllowed,
        this.averageRating,
        this.ratingCount,
        this.categories,
        this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    status = json['status'];
    featured = json['featured'];
    description = json['description'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    totalSales = json['total_sales'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    if (json['categories'] != null) {
      categories = new List<Category>();
      json['categories'].forEach((v) {
        categories.add(new Category.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['description'] = this.description;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['on_sale'] = this.onSale;
    data['purchasable'] = this.purchasable;
    data['total_sales'] = this.totalSales;
    data['reviews_allowed'] = this.reviewsAllowed;
    data['average_rating'] = this.averageRating;
    data['rating_count'] = this.ratingCount;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}