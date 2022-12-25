import 'package:movie_app/library.dart';

class MoviesByCategorys extends StatelessWidget {
  const MoviesByCategorys({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
        builder: (context, child) {
          return SizedBox(
              height: context.height * 0.4,
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
                      "Movies",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppBrand.mainColor),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: SizedBox(
                      height: 70,
                      child: FutureBuilder(
                        future: context.read<HomeProvider>().fetchCategorys(),
                        builder: (context, dataSnapshot) {
                          {
                            return Consumer<HomeProvider>(
                              builder: (context, list, child) =>
                                  ListView.builder(
                                      itemCount: list.getCategorysList.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: false,
                                      primary: false,
                                      itemBuilder: (_, index) => CategorysCard(
                                            id: list.getCategorysList[index].id,
                                            name: list
                                                .getCategorysList[index].name
                                                .toString(),
                                          )),
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: context.height * 0.21,
                    child: FutureBuilder(
                      future: context
                          .read<HomeProvider>()
                          .fetchMoviesBycategorysList(id: 28),
                      builder: (context, dataSnapshot) {
                        {
                          return Consumer<HomeProvider>(
                            builder: (context, list, child) {
                              List<MoviesDetailsModel> myList =
                                  list.getMoviesBycategorysList;
                              return ListView.builder(
                                  itemCount: myList.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (_, index) => SizedBox(
                                      child: MoviesByCategorysCard(
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
              ));
        });
  }
}

class MoviesByCategorysCard extends StatelessWidget {
  final MoviesDetailsModel movie;

  const MoviesByCategorysCard({super.key, required this.movie});

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
            movie: movie,
          )
        ],
      ),
    );
  }
}

class CategorysCard extends StatelessWidget {
  final String? name;
  final int? id;

  const CategorysCard({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeProvider>().setCatagoryId(id!);

        context.read<HomeProvider>().fetchMoviesBycategorysList(id: id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: context.read<HomeProvider>().getCategoryId == id
                  ? AppBrand.secondColor
                  : AppBrand.whiteColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          height: 60,
          width: 85,
          child: Center(
              child: Text(
            name!,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
