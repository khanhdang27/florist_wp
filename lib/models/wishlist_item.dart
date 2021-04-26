import 'package:gut7/models/models.dart';

class WishlistItem {
  int id;
  int wishlistId;
  int productId;
  int quantity;
  String createdAt;
  String updatedAt;
  Product product;

  WishlistItem(
      {this.id,
        this.wishlistId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.product});

  WishlistItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wishlistId = json['wishlist_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wishlist_id'] = this.wishlistId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}