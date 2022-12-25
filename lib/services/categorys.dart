// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:movie_app/config/endpoints.dart';
import 'package:movie_app/helpers/dio_helper.dart';
import 'package:movie_app/models/categorys_model.dart';
import 'package:movie_app/ui/components/tost.dart';

class CategorysServices {
  static Future<List<CategorysModel>> getCategorys() async {
    print("getCategorys");
    List<CategorysModel> getCategorys = [];
    Response res = await DioHelper.get(endpoint: EndPoints.categorys);
    getCategorys = (res.data["genres"] as List)
        .map((e) => CategorysModel.fromJson(e))
        .toList();
    if (res.statusCode == 200) {
      return getCategorys;
    } else {
      showToast(msg: "Failed to load data", status: false);
    }
    return getCategorys = [];
  }
}
