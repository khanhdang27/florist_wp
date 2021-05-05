import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';
import 'package:florist/screens/components/components.dart';

class ShippingRepository extends Repository {
  Future<Shipping> getOne({int Id}) async {
    var response = await httpManager.get(url: '/api/shipping/$Id');
    var data = response;

    Shipping results = Shipping.fromJson(data);
    return results;
  }

  Future<int> updateShipping(
      {int id, String name, String email, String phone, String address}) async {
    var response = await httpManager.put(url: '/api/shipping/$id', data: {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    });
    return 1;
  }
}
