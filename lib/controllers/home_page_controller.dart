import 'package:family/database/firestore_handler.dart';
import 'package:family/models/item_model.dart';
import 'package:family/utils/loading.dart';
import 'package:family/utils/prefs.dart';
import 'package:get/get.dart';

import '../consts/c_colors.dart';

class HomePageController extends GetxController {
  var itemLists = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    startListeningItemList();
  }

  // addDemoItems() {
  //   itemLists.add(ItemModel.fromJson({
  //     'isDone': false,
  //     'timestamp': DateTime.now().millisecondsSinceEpoch,
  //     'itemName': 'Mango',
  //     'itemPrice': '100',
  //   }));
  //   itemLists.add(ItemModel.fromJson({
  //     'isDone': false,
  //     'timestamp': DateTime.now().millisecondsSinceEpoch,
  //     'itemName': 'Apple',
  //     'itemPrice': '200',
  //   }));
  //   itemLists.add(ItemModel.fromJson({
  //     'isDone': false,
  //     'timestamp': DateTime.now().millisecondsSinceEpoch,
  //     'itemName': 'Orange',
  //     'itemPrice': '300',
  //   }));
  //   itemLists.add(ItemModel.fromJson({
  //     'isDone': false,
  //     'timestamp': DateTime.now().millisecondsSinceEpoch,
  //     'itemName': 'Banana',
  //     'itemPrice': '400',
  //   }));
  //   itemLists.add(ItemModel.fromJson({
  //     'isDone': false,
  //     'timestamp': DateTime.now().millisecondsSinceEpoch,
  //     'itemName': 'Grapes',
  //     'itemPrice': '500',
  //   }));
  // }
  //

  startListeningItemList() {
    FirestoreHandler.getListItemsStream(Prefs.listCode).listen((event) {
      var oldItems = itemLists.toList();
      itemLists.clear();
      for (var item in event.docs) {
        ItemModel? oldItem = oldItems.firstWhereOrNull(
          (element) => element.timestamp == item.data()['timestamp'],
        );
        if (oldItem != null) {
          itemLists.add(ItemModel.fromOldState(item.data(), oldItem));
        } else {
          itemLists.add(ItemModel.fromJson(item.data()));
        }
      }
      itemLists.refresh();
    });
  }

  addItem(String text) async {
    if (text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Please enter item name',
          backgroundColor: CColors.navyBlue,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    await Get.closeCurrentSnackbar();
    await Loading.show('Adding item');
    FirestoreHandler.setListItem(
      Prefs.listCode,
      ItemModel(
        isDone: false,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        itemName: text,
        itemPrice: '0',
      ),
    ).then((value) {
      Loading.hide();
      Get.back();
    });
  }

  deleteItem(int index) async {
    await Loading.show('Deleting item');
    FirestoreHandler.deleteListItem(
      Prefs.listCode,
      itemLists[index].timestamp!.toString(),
    ).then((value) {
      Loading.hide();
    });
  }

  updateItem(int index, Map<String, dynamic> values) async {
    FirestoreHandler.updateListItem(
      Prefs.listCode,
      itemLists[index].timestamp!.toString(),
      values,
    );
  }
}
