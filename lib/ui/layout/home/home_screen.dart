// ignore_for_file: avoid_print

import 'package:movie_app/library.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("#######################");
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            NewPlayingMovies(),
            UpComingMovies(),
            MoviesByCategorys(),
          ],
        ),
      ),
    );
  }
}
