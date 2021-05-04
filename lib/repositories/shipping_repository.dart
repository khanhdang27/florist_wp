import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';
import 'package:florist/screens/components/components.dart';

class ShippingRepository extends Repository{
  Future<Shipping> getOne({int Id}) async {
    var response = await httpManager.get(url: '/api/shipping/$Id');
    var data = response;

    Shipping results = Shipping.fromJson(data);
    return results;
  }
}