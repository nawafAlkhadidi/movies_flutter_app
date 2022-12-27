import 'dart:convert';
import 'package:movie_app/library.dart';

class FavoritesProvider with ChangeNotifier {
  ////////////////////////////! variables !/////////////////////////
  List<String> favoriteMovieId = Prefs.getDataList(key: "Favorites") ?? [];
  List<MoviesDetailsModel> _favoriteMovieList =
      jsonDecode(Prefs.getSting(key: "FavoriteModel")) == null
          ? []
          : (jsonDecode(Prefs.getSting(key: "FavoriteModel")) as List)
              .map((e) => MoviesDetailsModel.fromJson(e))
              .toList();

////////////////////////! variables !/////////////////////////

  List<MoviesDetailsModel> get getFavoriteMovieList => _favoriteMovieList;

  Future fetchFavoriteMovieList() async {
    _favoriteMovieList =
        jsonDecode(Prefs.getSting(key: "FavoriteModel")) == null
            ? []
            : (jsonDecode(Prefs.getSting(key: "FavoriteModel")) as List)
                .map((e) => MoviesDetailsModel.fromJson(e))
                .toList();
  }

  bool isFavorite(MoviesDetailsModel movie) {
    favoriteMovieId = Prefs.getDataList(key: "Favorites");
    if (favoriteMovieId.contains(movie.id.toString())) {
      return true;
    } else {
      return false;
    }
  }

  addOrRemoveFavorite(MoviesDetailsModel movie) async {
    favoriteMovieId = Prefs.getDataList(key: "Favorites");

    if (favoriteMovieId.contains(movie.id.toString())) {
      favoriteMovieId.remove(movie.id.toString());
      await Prefs.setData(key: "Favorites", value: favoriteMovieId);
      _favoriteMovieList.removeWhere((element) => element.id == movie.id!);
      await Prefs.setString('FavoriteModel', json.encode(_favoriteMovieList));
      await fetchFavoriteMovieList();
      // notifyListeners();
    } else {
      favoriteMovieId.add(movie.id.toString());
      await Prefs.setData(key: "Favorites", value: favoriteMovieId);
      _favoriteMovieList.add(movie);
      await Prefs.setString('FavoriteModel', json.encode(_favoriteMovieList));
     await fetchFavoriteMovieList();
    }
   // fetchFavoriteMovieList();
    notifyListeners();
  }
}
