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
}