import 'package:movie_app/library.dart';

class UpComingMovies extends StatelessWidget {
  const UpComingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
        builder: (context, child) {
          return SizedBox(
              height: context.height * 0.27,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      "UpComing",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppBrand.mainColor),
                    ),
                  ),

                  SizedBox(
                    height: context.height * 0.21,
                    child: FutureBuilder(
                      future:
                          context.read<HomeProvider>().fetchUpComingMovies(),
                      builder: (context, dataSnapshot) {
                        {
                          return Consumer<HomeProvider>(
                            builder: (context, list, child) => ListView.builder(
                                itemCount: list.getUpComingMoviesList.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (_, index) => SizedBox(
                                    child: UpComingMoviesCard(
                                        movie: list
                                            .getUpComingMoviesList[index]))),
                          );
                        }
                      },
                    ),
                  ),

                  //  NewPlayingPoster()
                ],
              ));
        });
  }
}

class UpComingMoviesCard extends StatelessWidget {
  final MoviesDetailsModel movie;

  const UpComingMoviesCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => MovieDetailsScreen(
                    movie: movie,
                  ));
            },
            child: CachedNetworkImage(
              imageBuilder: (
                context,
                imageProvider,
              ) =>
                  Container(
                height: context.height * 0.2,
                width: context.width * 0.31,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
              imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath!}",
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          FavoritesIcon(
              movie:movie,
            )
        ],
      ),
    );
  }
}
