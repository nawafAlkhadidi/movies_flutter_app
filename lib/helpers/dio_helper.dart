import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/constant/api_constant.dart';

class DioHelper {
  static const uri = ApiConstant.baseUrl;
  static final BaseOptions _options = BaseOptions(
    baseUrl: uri,
    connectTimeout: 60 * 1000,
    receiveTimeout: 60 * 1000,
    followRedirects: false,
    validateStatus: (status) => true,
  );

  static final Dio _dio = Dio(_options);

  static Future get({required String endpoint}) async {
    try {
      Response response = await _dio.get(endpoint , queryParameters: {'api_key': ApiConstant.apiKey , 'language' : "en-US" , 'page' : 1});
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
        print("no internet");
      }
    }
  }
}
