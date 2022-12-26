// ignore_for_file: avoid_print
import 'package:movie_app/library.dart';

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
