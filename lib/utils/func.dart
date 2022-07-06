import 'package:fluttertoast/fluttertoast.dart';
// import 'package:midpay/midpay.dart';

// final midPay = Midpay();

class Func {
  static Future<void> showToast({required String msg}) => Fluttertoast.cancel()
      .whenComplete(() => Fluttertoast.showToast(msg: msg));
  static Future<void> showToastServerError() => Fluttertoast.cancel()
      .whenComplete(() => Fluttertoast.showToast(msg: 'Kesalahan server'));
}
