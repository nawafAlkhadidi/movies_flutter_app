import 'package:movie_app/library.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MoviesDetailsModel movie;
  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieDetailsProvider>(
        create: (_) => MovieDetailsProvider(),
        builder: (context, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(300),
              child: AppBar(
                elevation: 0,
                backgroundColor: AppBrand.backgroundColor,
                flexibleSpace: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
                actions: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: FavoritesIcon(
                        movie: movie,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: IconButton(
                        icon:
                            const Icon(Icons.share, color: AppBrand.whiteColor),
                        onPressed: () async {
                          await Share.share(
                              "${movie.title}  https://www.themoviedb.org/movie/${movie.id}");
                        }),
                  )

                  //
                ],
              ),
            ),
            backgroundColor: AppBrand.backgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppBrand.blackColor.withOpacity(0.3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Text(
                              movie.releaseDate!.substring(0, 4),
                              style: const TextStyle(
                                  fontSize: 22, color: AppBrand.whiteColor),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  movie.voteAverage.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: AppBrand.whiteColor),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppBrand.blackColor.withOpacity(0.3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
                                ),
                                child: Column(
                                  children: [
                                    RatingBarIndicator(
                                      rating: movie.voteAverage / 2,
                                      itemBuilder: (context, index) =>
                                          const Icon(Icons.star,
                                              color: AppBrand.mainColor),
                                      itemCount: 5,
                                      itemSize: 25,
                                      direction: Axis.horizontal,
                                    ),
                                    Text(
                                      "Reviews : ${movie.voteCount} users",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppBrand.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppBrand.mainColor),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          movie.overview!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 15, color: AppBrand.whiteColor),
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Text(
                        "Cast",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppBrand.mainColor),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.26,
                      child: FutureBuilder(
                        future: context
                            .read<MovieDetailsProvider>()
                            .fetchGetCast(movie.id),
                        builder: (context, dataSnapshot) {
                          {
                            return Consumer<MovieDetailsProvider>(
                              builder: (context, list, child) {
                                List<CastModel> myList = list.getMoviesCastList;
                                return ListView.builder(
                                    itemCount: myList.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder: (_, index) => SizedBox(
                                            child: CastCard(
                                          profilePath:
                                              myList[index].profilePath,
                                          name: myList[index].name,
                                        )));
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// //

class CastCard extends StatelessWidget {
  final String? profilePath;
  final String? name;

  const CastCard({super.key, required this.profilePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          CachedNetworkImage(
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
            imageUrl: profilePath == null
                ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                : "https://image.tmdb.org/t/p/w500${profilePath!}",
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text(
            name!,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppBrand.whiteColor),
          ),
        ],
      ),
    );
  }
}
