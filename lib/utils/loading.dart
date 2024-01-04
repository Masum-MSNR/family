import 'package:get/get.dart';

import '../ui/widgets/loading_dialog.dart';

abstract class Loading {
  static show(String message) {
    Get.dialog(
      LoadingDialog(message: message),
      barrierDismissible: false,
    );
  }

  static void hide() {
    Get.back();
  }
}
