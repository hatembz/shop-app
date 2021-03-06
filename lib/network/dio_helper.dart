import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en',
      String? token,
      Map<String, dynamic>? data}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'authorization': '$token',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    Map<String, dynamic>? query,
    required String url,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'authorization': '$token',
      'Content-Type': 'application/json',
    };
    return await dio!.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
