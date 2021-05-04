import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class BagItemRepository extends Repository {
  Future<int> addBagItem({int bag_id, int product_id, int quantity}) async {
    var response = await httpManager.post(url: '/api/bag-item', data: {
      'bag_id': bag_id,
      'product_id': product_id,
      'quantity': quantity
    });
    return 1;
  }

  Future<int> addAllBagItem({int bag_id, int wishlist_id}) async {
    var response = await httpManager.post(url: '/api/bag-item/storeAll', data: {
      'bag_id': bag_id,
      'wishlist_id': wishlist_id,
    });
    return 1;
  }

  Future<int> bagChangeQuantity({int bag_item_id, int quantity}) async {
    var response = await httpManager
        .put(url: '/api/bag-item/$bag_item_id', data: {'quantity': quantity});
    var total = response['total'];
    return int.parse(total);
  }

  Future<Map> bagDeleteItem({int bag_item_id}) async {
    var response = await httpManager.delete(url: '/api/bag-item/$bag_item_id');
    var data = response['bag'];
    String total = response['total'] ?? '0';
    Map results = {
      'bag': Bag.fromJson(data),
      'total': int.parse(total),
    };
    return results;
  }
}
