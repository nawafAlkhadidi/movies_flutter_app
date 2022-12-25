
import 'package:movie_app/library.dart';

class MovieDetailsProvider with ChangeNotifier {
    List<CastModel> _moviesCastList = [];

////////////////////////! variables !/////////////////////////

  List<CastModel> get getMoviesCastList => _moviesCastList;

  Future fetchGetCast(int? id) async {
    _moviesCastList = await MoviesServices.getMoviesCast(id: id);
  }

 
}
