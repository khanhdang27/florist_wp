import 'package:flutter/material.dart';
import 'package:gut7/models/models.dart';
import 'package:gut7/repositories/repository.dart';
import 'package:gut7/screens/components/components.dart';

class ProductRepository extends Repository{

  Future<List<Product>> getRecom() async {
    var response = await httpManager.get(url: '/api/product/recom');
    List data = response;
    List<Product> results = data.map((e) {
      return Product(
        id: e['id'],
        name: e['name'],
        image: e['image'],
        model: e['model'],
        rating: e['rating'],
        countRate: e['count_rate'],
        price: e['price'],
        active: e['active'],
      );
    }).toList();
    return results;
  }

  Future<List<Product>> getOfCate(int categoryId) async {
    var response = await httpManager.get(url: '/api/product/productOfCate/$categoryId');
    List data = response['data'];
    List<Product> results = data.map((e) {
      return Product(
        id: e['id'],
        name: e['name'],
        image: e['image'],
        model: e['model'],
        rating: e['rating'],
        countRate: e['count_rate'],
        price: e['price'],
        active: e['active'],
      );
    }).toList();
    return results;
  }

  Future<Product> getOne({int Id}) async {
    var response = await httpManager.get(url: '/api/product/getOne/$Id');
    var data = response;

    Product results = Product.fromJson(data);
    return results;
  }
}