
import 'package:movie_app/library.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
