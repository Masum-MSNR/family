import 'package:family/models/item_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var itemLists = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    addDemoItems();
  }

  addDemoItems() {
    itemLists.add(ItemModel.fromJson({
      'isDone': false,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Mango',
      'itemPrice': '100',
    }));
    itemLists.add(ItemModel.fromJson({
      'isDone': false,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Apple',
      'itemPrice': '200',
    }));
    itemLists.add(ItemModel.fromJson({
      'isDone': false,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Orange',
      'itemPrice': '300',
    }));
    itemLists.add(ItemModel.fromJson({
      'isDone': false,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Banana',
      'itemPrice': '400',
    }));
    itemLists.add(ItemModel.fromJson({
      'isDone': false,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'itemName': 'Grapes',
      'itemPrice': '500',
    }));
  }
}
