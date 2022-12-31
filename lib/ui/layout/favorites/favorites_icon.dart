import 'package:movie_app/library.dart';

class FavoritesIcon extends StatelessWidget {
  final MoviesDetailsModel movie;

  const FavoritesIcon({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoritesProvider>(
        create: (_) => FavoritesProvider(),
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: IconButton(
              icon: Icon(Icons.favorite,
                  size: 30,
                  color: context.watch<FavoritesProvider>().isFavorite(movie)
                      ? Colors.red
                      : AppBrand.whiteColor.withOpacity(0.8)),
              onPressed: () {
                context.read<FavoritesProvider>().addOrRemoveFavorite(movie);
              },
            ),
          );
        });
  }
}
