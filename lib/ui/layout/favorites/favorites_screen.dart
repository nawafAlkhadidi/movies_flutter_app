import 'package:movie_app/library.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider movieProvider =
        Provider.of<FavoritesProvider>(context, listen: true);

    return RefreshIndicator(
      onRefresh: () async {
        movieProvider.fetchFavoriteMovieList();
      },
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movieProvider.status == EventLoadingStatus.loading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: GridView.count(
                        shrinkWrap: false,
                        crossAxisCount: 2,
                        children: List.generate(
                            movieProvider.getFavoriteMovieList.length, (index) {
                          return FavoritesMoviesCard(
                              movie: movieProvider.getFavoriteMovieList[index]);
                        })),
                  ),
          ],
        ),
      ),
    );
    //   });
  }
}

Shimmer getShimmerFavoritesLoading(BuildContext context) {
  return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              height: context.height * 0.2,
              width: context.width * 0.31,
              decoration: BoxDecoration(
                color: AppBrand.blackColor.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: Icon(Icons.favorite,
                    size: 30, color: AppBrand.blackColor.withOpacity(0.4)),
                onPressed: () {},
              ),
            )
          ],
        ),
      ));
}

class FavoritesMoviesCard extends StatelessWidget {
  final MoviesDetailsModel movie;

  const FavoritesMoviesCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MovieDetailsScreen(
              movie: movie,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: SizedBox(
          height: context.height * 0.15,
          width: context.width * 0.01,
          child: CachedNetworkImage(
            imageBuilder: (
              context,
              imageProvider,
            ) =>
                Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
              ),
            ),
            imageUrl: "https://image.tmdb.org/t/p/w200${movie.posterPath!}",
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
