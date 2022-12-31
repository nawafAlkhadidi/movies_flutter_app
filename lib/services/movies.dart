import 'package:movie_app/library.dart';

class MoviesServices {
  static Future<List<MoviesDetailsModel>> getNewPlayingMovies() async {
    List<MoviesDetailsModel> getNewPlayingList = [];
    Response res = await DioHelper.get(endpoint: EndPoints.nowPlaying);
    getNewPlayingList = (res.data["results"] as List)
        .map((e) => MoviesDetailsModel.fromJson(e))
        .toList();
    if (res.statusCode == 200) {
      return getNewPlayingList;
    } else {
      showToast(msg: "Failed to load data", status: false);
    }
    return getNewPlayingList = [];
  }

  static Future<List<MoviesDetailsModel>> getUpComingMovies() async {
    List<MoviesDetailsModel> getUpComingMoviesList = [];
    Response res = await DioHelper.get(endpoint: EndPoints.upComing);
    getUpComingMoviesList = (res.data["results"] as List)
        .map((e) => MoviesDetailsModel.fromJson(e))
        .toList();
    if (res.statusCode == 200) {
      return getUpComingMoviesList;
    } else {
      showToast(msg: "Failed to load data", status: false);
    }
    return getUpComingMoviesList = [];
  }

  static Future<List<MoviesDetailsModel>> getMoviesBycategorys(
      {int? id}) async {
    List<MoviesDetailsModel> getMoviesBycategorysList = [];
    Response res = await DioHelper.get(
      endpoint: EndPoints.moviesByCategorys.replaceFirst(':id', id.toString()),
    );
    getMoviesBycategorysList = (res.data["results"] as List)
        .map((e) => MoviesDetailsModel.fromJson(e))
        .toList();
    if (res.statusCode == 200) {
      return getMoviesBycategorysList;
    } else {
      showToast(msg: "Failed to load data", status: false);
    }
    return getMoviesBycategorysList = [];
  }

  static Future<List<MoviesDetailsModel>> getTrendingMovies() async {
    List<MoviesDetailsModel> getTrendingMoviesList = [];
    Response res = await DioHelper.get(endpoint: EndPoints.trending);
    getTrendingMoviesList = (res.data["results"] as List)
        .map((e) => MoviesDetailsModel.fromJson(e))
        .toList();
    if (res.statusCode == 200) {
      return getTrendingMoviesList;
    } else {
      showToast(msg: "Failed to load data", status: false);
    }
    return getTrendingMoviesList = [];
  }

  static Future<List<CastModel>> getMoviesCast({int? id}) async {
    List<CastModel> getMoviesCastList = [];
    Response res = await DioHelper.get(
      endpoint: EndPoints.cast.replaceFirst(':id', id.toString()),
    );
    getMoviesCastList =
        (res.data["cast"] as List).map((e) => CastModel.fromJson(e)).toList();
    if (res.statusCode == 200) {
      return getMoviesCastList;
    } else {
      showToast(msg: "Failed to load data", status: false);
    }
    return getMoviesCastList = [];
  }
}
