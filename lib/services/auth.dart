import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:gut7/models/models.dart';

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
      print(response.data.toString());

      String token = response.data.toString();
      this.tryToken(token: token);
      return token;
    } catch (e){
      print(e);
    }
  }

  void tryToken({String token}) async{
    if (token == null){
      return;
    }else {
      try {
        Dio.Response response = await dio()
            .get('/member', options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
        this._isLoggedIn = true;
        this._member = Member.fromJson(response.data);
        notifyListeners();

        print(_member);

      } catch (e) {
        print(e);
      }
    }
  }

  void logout(){
    _isLoggedIn = false;

    notifyListeners();
  }
}