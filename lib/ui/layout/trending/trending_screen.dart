import 'package:movie_app/library.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrendingProvider>(
        create: (_) => TrendingProvider(),
        builder: (context, child) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<TrendingProvider>().fetchTrendingMovies();
            },
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: context
                          .read<TrendingProvider>()
                          .fetchTrendingMovies(),
                      builder: (context, dataSnapshot) {
                        {
                          return Consumer<TrendingProvider>(
                            builder: (context, list, child) {
                              List<MoviesDetailsModel> myList =
                                  list.getTrendingMoviesList;
                              return ListView.builder(
                                  itemCount: myList.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (_, index) => SizedBox(
                                      child: TrendingMoviesCard(
                                          movie: myList[index])));
                            },
                          );
                        }
                      },
                    ),
                  ),
                  // SizedBox(
                  //   height: context.height * 0.21,
                  //   child:
                  // ),
                  //  NewPlayingPoster()
                ],
              ),
            ),
          );
        });
  }
}

class TrendingMoviesCard extends StatelessWidget {
  final MoviesDetailsModel movie;

  const TrendingMoviesCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: () {
            Get.to(() => MovieDetailsScreen(
                  movie: movie,
                ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              CachedNetworkImage(
                imageBuilder: (
                  context,
                  imageProvider,
                ) =>
                    Container(
                  height: context.height * 0.24,
                  //width: context.width * 0.31,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                ),
                imageUrl:
                    "https://image.tmdb.org/t/p/w500${movie.backdropPath!}",
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppBrand.whiteColor.withOpacity(.3),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  movie.title!,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppBrand.blackColor),
                  textAlign: TextAlign.center,
                )),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: FavoritesIcon(
            movie: movie,
          ),
        )
      ],
    );
  }
}
