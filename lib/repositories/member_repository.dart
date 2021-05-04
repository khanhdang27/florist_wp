import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';
import 'package:florist/screens/components/components.dart';

class MemberRepository extends Repository{
  Future<Member> getOne({int Id}) async {
    var response = await httpManager.get(url: '/api/member/getOne/$Id');
    var data = response;

    Member results = Member(
      id: data['id'],
      name: data['name'],
      point: data['point'],
      phone: data['phone'],
      email: data['email'],
      pass: data['pass'],
      avatar: Globals().urlImage+data['avatar'],
      rating: data['rating'],
      countRate: data['count_rate'],
      active: data['active'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
    return results;
  }

  Future<int> memberRegister({String name, String phone, String email, String pass}) async {
    var response = await httpManager.post(url: '/api/member', data: {
      'name': name,
      'phone': phone,
      'email': email,
      'pass': pass,
    });
    return 1;
  }
}