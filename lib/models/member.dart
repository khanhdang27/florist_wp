import 'dart:convert';

class Member{
  String name;
  int point;
  String phone;
  String email;
  String pass;
  String avatar;
  double rating;
  int count_rate;
  int active;

  Member({this.name, this.point, this.phone, this.email, this.pass, this.avatar,
    this.rating, this.count_rate, this.active});

  Member.fromJson(Map <String, dynamic> json)
  :
    name = json['name'],
    point = json['point'],
    phone = json['phone'],
    email = json['email'],
    pass = json['pass'],
    avatar = json['avatar'],
    rating = json['rating'],
    count_rate = json['count_rate'],
    active = json['active'];
}