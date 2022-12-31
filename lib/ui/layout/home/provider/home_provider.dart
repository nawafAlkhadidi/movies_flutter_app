// ignore_for_file: file_names

import 'package:movie_app/library.dart';

class HomeProvider with ChangeNotifier {
  ////////////////////////////! variables !/////////////////////////
  List<MoviesDetailsModel> _newPlayingMoviesList = [];
  List<MoviesDetailsModel> _upComingMoviesList = [];
  List<CategorysModel> _categorysList = [];
  List<MoviesDetailsModel> _moviesBycategorysList = [];
  int categoryId = 28;
////////////////////////! variables !/////////////////////////

  List<MoviesDetailsModel> get getNewPlayingMoviesList => _newPlayingMoviesList;

  Future fetchNewPlaying() async {
    _newPlayingMoviesList = await MoviesServices.getNewPlayingMovies();
  }

  List<MoviesDetailsModel> get getUpComingMoviesList => _upComingMoviesList;

  Future fetchUpComingMovies() async {
    _upComingMoviesList = await MoviesServices.getUpComingMovies();
  }

  List<CategorysModel> get getCategorysList => _categorysList;

  Future fetchCategorys() async {
    _categorysList = await CategorysServices.getCategorys();
  }

  List<MoviesDetailsModel> get getMoviesBycategorysList =>
      _moviesBycategorysList;

  Future fetchMoviesBycategorysList({int? id}) async {
    _moviesBycategorysList =
        await MoviesServices.getMoviesBycategorys(id: categoryId);
    setCatagoryId(id!);
  }

  int get getCategoryId => categoryId;

  setCatagoryId(int id) {
    categoryId = id;
    notifyListeners();
  }
}
