import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class BagRepository extends Repository {
  Future<Map> getOne({int id}) async {
    var response = await httpManager.get(url: '/api/bag/$id');
    var data = response['bag'];
    String total = response['total'] ?? '0';
    Map results = {
      'bag': Bag.fromJson(data),
      'total': int.parse(total),
    };
    return results;
  }

  Future<int> updateBag(
      {int id, String name, String phone, String address, String pay}) async {
    var response = await httpManager.put(url: '/api/bag/$id', data: {
      'ship_name': name,
      'ship_phone': phone,
      'ship_address': address,
      'pay': pay,
    });
    var data = response['id'];
    await SharedPrefs.setBagId(response['id']);
    return response['id'];
  }
}