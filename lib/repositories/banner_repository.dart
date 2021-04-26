import 'package:flutter/material.dart';
import 'package:gut7/models/models.dart';
import 'package:gut7/repositories/repository.dart';
import 'package:gut7/screens/components/components.dart';

class BannerRepository extends Repository{

  Future<List<BannerDB>> getAll() async {
    var response = await httpManager.get(url: '/api/banner');
    List data = response['data'];
    List<BannerDB> results = data.map((e) {
      return BannerDB(
        id: e['id'],
        name: e['name'],
        description: e['description'],
        image: e['image'],
        active: e['active'],
        categoryId: e['category_id']
      );
    }).toList();
    return results;
  }

  Future<BannerDB> getOne({int Id}) async {
    var response = await httpManager.get(url: '/api/banner/$Id');
    var data = response;
    BannerDB results = BannerDB(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        image: Globals().urlImage+data['image'],
        active: data['active'],
      );
    return results;
  }
}