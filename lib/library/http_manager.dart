import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HTTPManager {
  BaseOptions baseOptions = BaseOptions(
    baseUrl: 'http://10.0.2.2:8000',
    connectTimeout: 10000,
    receiveTimeout: 10000,
    responseType: ResponseType.json,
  );

  Future<BaseOptions> exportOption() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')??'';

    final Map<String, dynamic> header = {};
    baseOptions.headers.addAll(header);

    if (token != null) {
      baseOptions.headers["Authorization"] = 'Bearer ' + token;
    }
    return baseOptions;
  }

  Future<dynamic> post({
    String url,
    Map<String, dynamic> data,
    Options options,
  }) async {
    Dio dio = new Dio(await exportOption());
    try {
      final response = await dio.post(
        url,
        data: data,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      throw error;
    }
  }

  Future<dynamic> put({
    String url,
    Map<String, dynamic> data,
    Options options,
  }) async {
    Dio dio = new Dio(await exportOption());
    try {
      final response = await dio.put(
        url,
        data: data,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      throw error;
    }
  }

  Future<dynamic> get({
    String url,
    Map<String, dynamic> params,
    Options options,
  }) async {
    Dio dio = new Dio(await exportOption());
    try {
      final response = await dio.get(
        url,
        queryParameters: params,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {}
  }

  Future<dynamic> delete({
    String url,
    Map<String, dynamic> params,
    Options options,
  }) async {
    Dio dio = new Dio(await exportOption());
    try {
      final response = await dio.delete(
        url,
        queryParameters: params,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {}
  }

  //Singleton
  static final HTTPManager _instance = HTTPManager._internal();

  factory HTTPManager() {
    return _instance;
  }

  HTTPManager._internal();
}
