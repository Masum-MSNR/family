import 'package:get/get.dart';

abstract class FSnackBar {
  static void show({String? title, required String message, int? duration}) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: Duration(seconds: duration ?? 2),
      ),
    );
  }
}
