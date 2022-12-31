import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/library.dart';

showToast({String? msg, bool? status}) {
  msg == null
      ? false
      : Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: status!
              ? AppBrand.mainColor.withOpacity(0.6)
              : Colors.redAccent.shade200,
          textColor: Colors.black, //Colors.white,
          fontSize: 16.0);
}
