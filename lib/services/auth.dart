import 'package:dio/dio.dart' as Dio;
import 'package:florist/screens/components/components.dart';
import 'package:flutter/material.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dio.dart';

class Auth extends ChangeNotifier{

  bool _isLoggedIn = false;
  Member _member;
  String _token;

  bool get authenticated =>_isLoggedIn;
  Member get member => _member;

  Future<String> login({Map creds}) async{
    try{
      Dio.Response response = await dio().post('/login', data: creds);
      String token = response.data['token'];
      int wishlist_id = response.data['wishlist_id'];
      int bag_id = response.data['bag'];
      Member member = Member.fromJson(response.data['member']);
      /*SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setInt('member_id', member.id);*/
      await SharedPrefs.setToken(token);
      await SharedPrefs.setMemberId(member.id);
      await SharedPrefs.setWishlistId(wishlist_id);
      await SharedPrefs.setBagId(bag_id);
      await SharedPrefs.setAvatar(Globals().urlImage + member.avatar);

 //     this.tryToken(token: token);
      return token;
    } catch (e){
      print(e);
    }
  }

  /*void tryToken({String token}) async{
    if (token == null){
      return;
    }else {
      try {
        Dio.Response response = await dio()
            .get('/member', options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
        this._isLoggedIn = true;
        this._member = Member.fromJson(response.data);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }*/

  void logout(){
    _isLoggedIn = false;

    notifyListeners();
  }
}