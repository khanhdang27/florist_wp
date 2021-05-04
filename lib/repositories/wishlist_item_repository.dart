import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class WishlistItemRepository extends Repository {
  Future<int> addWishlist(
      {int wishlist_id, int product_id, int quantity}) async {
    var response = await httpManager.post(url: '/api/wish-list-item', data: {
      'wishlist_id': wishlist_id,
      'product_id': product_id,
      'quantity': quantity
    });
    return 1;
  }

  Future<int> changeQuantity({int wishlist_item_id, int quantity}) async {
    var response = await httpManager.put(
        url: '/api/wish-list-item/$wishlist_item_id',
        data: {'quantity': quantity});
    var total = response['total'];
    return int.parse(total);
  }

  Future<Map> deleteItem({int wishlist_item_id}) async {
    var response =
        await httpManager.delete(url: '/api/wish-list-item/$wishlist_item_id');
    var data = response['wishList'];
    String total = response['total'] ?? '0';
    Map results = {
      'wishlist': Wishlist.fromJson(data),
      'total': int.parse(total),
    };
    return results;
  }
}
