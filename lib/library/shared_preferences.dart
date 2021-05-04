import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _preferences;

   static const _keyToken = 'token';
   static const _keyMemberId = 'member_id';
   static const _keyWishlistId = 'wishlist_id';
   static const _keyBagId = 'bag_id';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await _preferences.setString(_keyToken, token);

  static String getToken() => _preferences.getString(_keyToken);

  static Future setMemberId(int id) async =>
      await _preferences.setInt(_keyMemberId, id);

  static int getMemberId() => _preferences.getInt(_keyMemberId);

  static Future setWishlistId(int id) async =>
      await _preferences.setInt(_keyWishlistId, id);

  static int getWishlistId() => _preferences.getInt(_keyWishlistId);

  static Future setBagId(int id) async =>
      await _preferences.setInt(_keyBagId, id);

  static int getBagId() => _preferences.getInt(_keyBagId);

  static String getLanguageName() => _preferences.getString('language_name')??'繁體中文';

}