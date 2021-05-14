import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class CategoryRepository extends Repository {
  Future<List<Category>> getAll() async {
    var response = await httpManager.get(url: '/api/category');
    List data = response;
    List<Category> results = data.map((e) {
      return Category.fromJson(e);
    }).toList();
    return results;
  }
  Future<int> themCate(String name)async{
    //themecasc
    //check
    //them
    //var r = httpManager.post('asd',{'name':name});

    return 1;
  }
}
