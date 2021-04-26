class Member {
  int id;
  String name;
  int point;
  String phone;
  String email;
  String pass;
  String avatar;
  String rating;
  int countRate;
  int active;
  String createdAt;
  String updatedAt;

  Member(
      {this.id,
        this.name,
        this.point,
        this.phone,
        this.email,
        this.pass,
        this.avatar,
        this.rating,
        this.countRate,
        this.active,
        this.createdAt,
        this.updatedAt});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    point = json['point'];
    phone = json['phone'];
    email = json['email'];
    pass = json['pass'];
    avatar = json['avatar'];
    rating = json['rating'];
    countRate = json['count_rate'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['point'] = this.point;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['pass'] = this.pass;
    data['avatar'] = this.avatar;
    data['rating'] = this.rating;
    data['count_rate'] = this.countRate;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}