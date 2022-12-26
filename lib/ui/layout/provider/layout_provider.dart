import 'package:movie_app/library.dart';

class LayoutProvider with ChangeNotifier {
  ////////////////////////////! variables !/////////////////////////
  List<Widget> pages = [
    const HomeScreen(),
    const TrendingScreen(),
    const FavoritesScreen(),
  ];
  List<String> appBarTitle = [
    "Movies",
    "Trending",
    "Favorites",
  ];
  int _index = 0;
  PageController pageController = PageController();
////////////////////////! variables !/////////////////////////

  PageController get myPageController {
    return pageController;
  }

  int get getindex {
    return _index;
  }

  onTabIcon(index) {
    _index = index;
    pageController = PageController(initialPage: index);
    notifyListeners();
  }

  List<Widget> get getPages {
    return pages;
  }

  List<String> get getAppBarTitle {
    return appBarTitle;
  }
}
