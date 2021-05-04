class Shipping {
  int id;
  int memberId;
  String name;
  String email;
  String phone;
  String city;
  String district;
  String detailAddress;
  int active;
  String createdAt;
  String updatedAt;

  Shipping(
      {this.id,
        this.memberId,
        this.name,
        this.email,
        this.phone,
        this.city,
        this.district,
        this.detailAddress,
        this.active,
        this.createdAt,
        this.updatedAt});

  Shipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    district = json['district'];
    detailAddress = json['detail_address'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['district'] = this.district;
    data['detail_address'] = this.detailAddress;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}