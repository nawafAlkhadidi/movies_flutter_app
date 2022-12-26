import 'package:movie_app/library.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
 //await Prefs.clearAllSharedPref();
  if (Prefs.getDataList(key: "Favorites") == null) {
    List<String> favoriteMovieId = [];
    Prefs.setData(key: "Favorites", value: favoriteMovieId);
    Prefs.setData(key: "FavoriteModel", value: "null");
  }
  Provider.debugCheckInvalidValueType = null;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LayoutProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => TrendingProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
      ),
      home: const LayoutScreen(),
    );
  }
}
