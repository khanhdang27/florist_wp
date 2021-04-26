import 'package:gut7/models/models.dart';

class Review {
  int id;
  int memberId;
  int productId;
  String content;
  int active;
  String createdAt;
  String updatedAt;
  Member member;

  Review(
      {this.id,
        this.memberId,
        this.productId,
        this.content,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.member});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    productId = json['product_id'];
    content = json['content'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    member =
    json['member'] != null ? new Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['product_id'] = this.productId;
    data['content'] = this.content;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.member != null) {
      data['member'] = this.member.toJson();
    }
    return data;
  }
}