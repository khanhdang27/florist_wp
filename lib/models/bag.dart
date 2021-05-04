import 'package:florist/models/models.dart';

class Bag {
  int id;
  int memberId;
  int isbag;
  String shipName;
  String shipPhone;
  String shipAddress;
  String pay;
  String couponId;
  String couponCode;
  int usePoint;
  String createdAt;
  String updatedAt;
  List<BagItem> bagItem;
  Member member;

  Bag(
      {this.id,
        this.memberId,
        this.isbag,
        this.shipName,
        this.shipPhone,
        this.shipAddress,
        this.pay,
        this.couponId,
        this.couponCode,
        this.usePoint,
        this.createdAt,
        this.updatedAt,
        this.bagItem,
        this.member});

  Bag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    isbag = json['isbag'];
    shipName = json['ship_name'];
    shipPhone = json['ship_phone'];
    shipAddress = json['ship_address'];
    pay = json['pay'];
    couponId = json['coupon_id'];
    couponCode = json['coupon_code'];
    usePoint = json['use_point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['bag_item'] != null) {
      bagItem = new List<BagItem>();
      json['bag_item'].forEach((v) {
        bagItem.add(new BagItem.fromJson(v));
      });
    }
    member =
    json['member'] != null ? new Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['isbag'] = this.isbag;
    data['ship_name'] = this.shipName;
    data['ship_phone'] = this.shipPhone;
    data['ship_address'] = this.shipAddress;
    data['pay'] = this.pay;
    data['coupon_id'] = this.couponId;
    data['coupon_code'] = this.couponCode;
    data['use_point'] = this.usePoint;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.bagItem != null) {
      data['bag_item'] = this.bagItem.map((v) => v.toJson()).toList();
    }
    if (this.member != null) {
      data['member'] = this.member.toJson();
    }
    return data;
  }
}