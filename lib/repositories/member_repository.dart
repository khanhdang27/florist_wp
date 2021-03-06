import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';
import 'package:florist/screens/components/components.dart';

class MemberRepository extends Repository {
  Future<Member> getOne({int Id}) async {
    var response = await httpManager.get(url: '/api/member/getOne/$Id');
    var data = response;

    Member results = Member(
      id: data['id'],
      name: data['name'],
      point: data['point'],
      phone: data['phone'],
      email: data['email'],
      pass: data['pass'],
      avatar: Globals().urlImage + data['avatar'],
      rating: data['rating'],
      countRate: data['count_rate'],
      active: data['active'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
    return results;
  }

  Future<int> memberRegister({String name, String email, String pass}) async {
    FormData formData = FormData.fromMap({
      'username': name,
      'email': email,
      'password': pass,
    });
    var response = await httpManager.post(
      url: 'wp-content/themes/porto/api/register.php',
      data: formData,
    );
    Map responseMap = jsonDecode(response);
    int status = responseMap['code'] ?? responseMap['status'];
    return status;
  }

  Future<Map> forgotPass({String email}) async {
    var response = await httpManager.post(url: '/api/member/forgotPass', data: {
      'email': email,
    });

    var data = response;
    String code = response['code'] ?? 'error';
    int id = response['id'] ?? 0;
    Map results = {
      'id': id,
      'code': code,
    };

    return results;
  }

  Future<Map> checkExist({String email, String phone}) async {
    var response = await httpManager.post(url: '/api/member/checkExist', data: {
      'email': email,
      'phone': phone,
    });

    String statusEmail = response['status_email'];
    String statusPhone = response['status_phone'];
    Map results = {
      'status_email': statusEmail,
      'status_phone': statusPhone,
    };

    return results;
  }

  Future<int> resetPass({int id, String pass}) async {
    var response =
        await httpManager.put(url: '/api/member/resetPass/$id', data: {
      'pass': pass,
    });
    return 1;
  }
}
