import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class ReviewRepository extends Repository{
  Future<List<Review>> getAll(int productId) async {
    var response = await httpManager.get(url: '/api/review/$productId');
    List data = response['data'];
    List<Review> results = data.map((e) {
      return Review(
        id: e['id'],
        memberId: e['member_id'],
        productId: e['product_id'],
        content: e['content'],
        createdAt: e['created_at'],
        member: Member.fromJson(e['member']),
      );
    }).toList();

    return results;
  }
}