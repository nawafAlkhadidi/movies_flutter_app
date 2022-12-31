import 'package:movie_app/library.dart';

class TrendingProvider with ChangeNotifier {
  ////////////////////////! variables !/////////////////////////
  List<MoviesDetailsModel> _trendingMoviesList = [];
////////////////////////! variables !/////////////////////////

  List<MoviesDetailsModel> get getTrendingMoviesList => _trendingMoviesList;

  Future fetchTrendingMovies() async {
    _trendingMoviesList = await MoviesServices.getTrendingMovies();
  }
}
