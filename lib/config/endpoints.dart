class EndPoints {
  static const nowPlaying =
      'movie/now_playing?api_key=6f412be30ca7ebb35030e711e82e383e&language=en-US&page=1';
  static const upComing =
      'movie/upcoming?api_key=6f412be30ca7ebb35030e711e82e383e&language=en-US&page=1';
  static const categorys =
      'genre/movie/list?api_key=6f412be30ca7ebb35030e711e82e383e&language=en-US';

  static const moviesByCategorys =
      'discover/movie?api_key=6f412be30ca7ebb35030e711e82e383e&include_video=false&page=1&with_genres=:id';

  static const cast =
      "https://api.themoviedb.org/3/movie/:id/credits?api_key=6f412be30ca7ebb35030e711e82e383e&language=en-US";

 static const trending =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=6f412be30ca7ebb35030e711e82e383e";
}
