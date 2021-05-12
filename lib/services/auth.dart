import 'package:dio/dio.dart' as Dio;
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/material.dart';

import 'dio.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  Member _member;
  String _token;

  bool get authenticated => _isLoggedIn;

  Member get member => _member;

  Future<String> login({Map creds}) async {
    try {
      Dio.Response response = await dio().post('/login', data: creds);
      String token = response.data['token'];
      int wishlist_id = response.data['wishlist_id'];
      int bag_id = response.data['bag'];
      Member member = Member.fromJson(response.data['member']);
      await SharedPrefs.setToken(token);
      await SharedPrefs.setMemberId(member.id);
      await SharedPrefs.setWishlistId(wishlist_id);
      await SharedPrefs.setBagId(bag_id);
      await SharedPrefs.setAvatar(Globals().urlImage + member.avatar);

      return token;
    } catch (e) {
      print(e);
    }
  }

  Future<String> loginExternal({Map creds}) async {

    try {
      Dio.Response response = await dio().post('/login-external', data: creds);

      String token = response.data['token'];
      int wishlist_id = response.data['wishlist_id'];
      int bag_id = response.data['bag'];
      Member member = Member.fromJson(response.data['member']);
      await SharedPrefs.setToken(token);
      await SharedPrefs.setMemberId(member.id);
      await SharedPrefs.setWishlistId(wishlist_id);
      await SharedPrefs.setBagId(bag_id);
      await SharedPrefs.setAvatar(Globals().urlImage + member.avatar);
      return token;
    } catch (e) {
      throw e;
    }
  }

  void logout() {
    _isLoggedIn = false;

    notifyListeners();
  }
}
