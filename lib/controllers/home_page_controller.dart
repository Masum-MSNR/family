import 'package:family/models/shopping_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var itemLists = <ShoppingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    addDemoItems();
  }

  addDemoItems() {
    itemLists.add(ShoppingModel.fromJson({
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Mango',
      'itemPrice': '100',
    }));
    itemLists.add(ShoppingModel.fromJson({
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Apple',
      'itemPrice': '200',
    }));
    itemLists.add(ShoppingModel.fromJson({
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Orange',
      'itemPrice': '300',
    }));
    itemLists.add(ShoppingModel.fromJson({
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Banana',
      'itemPrice': '400',
    }));
    itemLists.add(ShoppingModel.fromJson({
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Grapes',
      'itemPrice': '500',
    }));
  }
}
