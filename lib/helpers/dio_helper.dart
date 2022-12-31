import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static const uri = 'https://api.themoviedb.org/3/';
  static final BaseOptions _options = BaseOptions(
    baseUrl: uri,
    connectTimeout: 60 * 1000,
    receiveTimeout: 60 * 1000,
    followRedirects: false,
    validateStatus: (status) => true,
  );

  static final Dio _dio = Dio(_options);

  static Future getWithToken(
      {required String endpoint, required String token}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      Response response =
          await _dio.get(endpoint, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
        if (e.type == DioErrorType.connectTimeout) {
          throw Exception("Connection Timeout Exception");
        }
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future postWithToken(
      {required String endpoint,
      required dynamic data,
      required String token}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      Response response = await _dio.post(endpoint,
          data: data, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw Exception("Connection Timeout Exception");
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e);
        print("no internet");
      }
    }
  }

  static Future post({required String endpoint, Object data = const {}}) async {
    try {
      Response response = await _dio.post(endpoint,
          data: data,
          options: Options(headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          }));
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e);
        print("no internet");
      }
    }
  }

  static Future get({required String endpoint}) async {
    try {
      Response response = await _dio.get(endpoint);
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
