import 'package:flutter/material.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';
import 'package:florist/screens/components/components.dart';

class BannerRepository extends Repository{

  Future<List<BannerDB>> getAll() async {
    var response = await httpManager.get(url: '/api/banner');
    List data = response;
    List<BannerDB> results = data.map((e) {
      return BannerDB.fromJson(e);
    }).toList();
    return results;
  }

  Future<BannerDB> getOne({int Id}) async {
    var response = await httpManager.get(url: '/api/banner/$Id');
    var data = response;
    BannerDB results = BannerDB.fromJson(data);
    return results;
  }
}