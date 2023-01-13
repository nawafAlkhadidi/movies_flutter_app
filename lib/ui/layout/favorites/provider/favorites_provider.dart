import 'dart:convert';
import 'package:movie_app/library.dart';

enum EventLoadingStatus { notLoaded, loading, loaded }

class FavoritesProvider with ChangeNotifier {
  ////////////////////////////! variables !/////////////////////////
  List<MoviesDetailsModel> _favoriteMovieList =
      jsonDecode(Prefs.getSting(key: "Favorite")) == null
          ? []
          : (jsonDecode(Prefs.getSting(key: "Favorite")) as List)
              .map((e) => MoviesDetailsModel.fromJson(e))
              .toList();
////////////////////////! variables !/////////////////////////
  EventLoadingStatus _eventLoadingStatus = EventLoadingStatus.notLoaded;

  EventLoadingStatus get status => _eventLoadingStatus;

  List<MoviesDetailsModel> get getFavoriteMovieList => _favoriteMovieList;

  Future<List<MoviesDetailsModel>> fetchFavoriteMovieList() async {
    _eventLoadingStatus = EventLoadingStatus.loading;

    notifyListeners();
    _favoriteMovieList = jsonDecode(Prefs.getSting(key: "Favorite")) == null
        ? []
        : (jsonDecode(Prefs.getSting(key: "Favorite")) as List)
            .map((e) => MoviesDetailsModel.fromJson(e))
            .toList();
    _eventLoadingStatus = EventLoadingStatus.loaded;
    notifyListeners();
    return _favoriteMovieList;
  }

  addOrRemoveFavorite(MoviesDetailsModel movie) async {
    if (isFavorite(movie)) {
      _favoriteMovieList.removeWhere((element) => element.id == movie.id!);
    } else {
      _favoriteMovieList.add(movie);
    }
    await Prefs.setString('Favorite', json.encode(_favoriteMovieList));
    fetchFavoriteMovieList();
  }

  bool isFavorite(MoviesDetailsModel movie) {
    return _favoriteMovieList.any((element) => element.id == movie.id!);
  }
}
