import 'package:gut7/models/models.dart';
import 'package:gut7/repositories/repository.dart';

class WishlistRepository extends Repository {
  Future<Map> getOne({int id}) async {
    var response = await httpManager.get(url: '/api/wish-list/$id');
    var data = response['wishList'];
    String total = response['total'] ?? '0';
    Map results = {
      'wishlist': Wishlist.fromJson(data),
      'total': int.parse(total),
    };
    return results;
  }
}

// Wishlist results = Wishlist(
//   id: data['id'],
//   memberId: data['member_id'],
//   member: Member.fromJson(data['member']),
//   wishListItem: wishListRaw.map((e) {
//     return WishlistItem.fromJson(e);
//   }).toList(),
// );
