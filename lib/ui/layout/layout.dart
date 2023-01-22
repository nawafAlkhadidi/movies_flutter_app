import 'package:movie_app/library.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutprovider =
        Provider.of<LayoutProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 30,
          title: Text(
            layoutprovider.getAppBarTitle[layoutprovider.getindex],
            style: const TextStyle(
                color: AppBrand.mainColor, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppBrand.backgroundColor,
          elevation: 0,
        ),
        backgroundColor: AppBrand.backgroundColor,
        bottomNavigationBar: CircleNavBar(
          activeIndex: layoutprovider.getindex,
          activeIcons: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                "assets/icons/popcorn.svg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                "assets/icons/fire.svg",
                height: 20,
                width: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                "assets/icons/favorite.svg",
              ),
            ),
          ],
          inactiveIcons: [
            SvgPicture.asset(
              "assets/icons/popcorn.svg",
              height: 40,
              width: 40,
            ),
            SvgPicture.asset(
              "assets/icons/fire.svg",
              height: 40,
              width: 40,
            ),
            SvgPicture.asset(
              "assets/icons/favorite.svg",
              height: 40,
              width: 40,
            ),
          ],
          color: Colors.white,
          circleColor: Colors.white,
          height: 80,
          circleWidth: 70,
          onTap: (index) {
            layoutprovider.onTabIcon(index);
          },
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          circleShadowColor: Colors.deepPurple,
          elevation: 0,
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.red],
          ),
          iconCurve: Curves.easeInBack,
          circleGradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.red],
          ),
        ),
        body: layoutprovider.getPages[layoutprovider.getindex]);
  }
}
