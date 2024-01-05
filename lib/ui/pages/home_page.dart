import 'package:family/consts/c_colors.dart';
import 'package:family/ui/widgets/popups/add_sheet.dart';
import 'package:family/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../controllers/home_page_controller.dart';
import '../widgets/item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.navyBlue,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: const Icon(
          Icons.shopping_bag_outlined,
          size: 30,
          color: CColors.white,
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shopping List',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: CColors.white,
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              Prefs.listCode,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: CColors.white,
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              //share in socials using share package link
              Share.share(
                '${Prefs.listCode} is your family shopping list code. '
                'You can join your family shopping list using this code.',
              );
            },
            customBorder: const CircleBorder(),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Icon(
                Icons.share_outlined,
                color: CColors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => ListView.builder(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 100,
                right: 16,
                left: 16,
              ),
              shrinkWrap: true,
              itemCount: _controller.itemLists.length,
              itemBuilder: (context, index) {
                return ItemTile(
                  item: _controller.itemLists[index],
                  onDone: (value) async {
                    // _controller.itemLists[index].isDone = value;
                    // _controller.itemLists.refresh();
                    await _controller.updateItem(index, {
                      'isDone': value,
                    });
                  },
                  onPriceTap: () {
                    _controller.itemLists[index].isPriceEditing = true;
                    _controller.itemLists.refresh();
                  },
                  onPriceEditDone: () async {
                    _controller.itemLists[index].isPriceEditing = false;
                    _controller.itemLists.refresh();
                    await _controller.updateItem(index, {
                      'itemPrice': _controller
                          .itemLists[index].itemPriceController!.text,
                    });
                  },
                  onNameTap: () {
                    _controller.itemLists[index].isNameEditing = true;
                    _controller.itemLists.refresh();
                  },
                  onNameEditDone: () async {
                    _controller.itemLists[index].isNameEditing = false;
                    _controller.itemLists.refresh();
                    await _controller.updateItem(index, {
                      'itemName':
                          _controller.itemLists[index].itemNameController!.text,
                    });
                  },
                  onDelete: () async {
                    await _controller.deleteItem(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.navyBlue,
        onPressed: () {
          final itemNameController = TextEditingController();
          Get.bottomSheet(AddSheet(
            buttonText: 'Add',
            hint: 'Item Name',
            controller: itemNameController,
            onTap: () async {
              await _controller.addItem(itemNameController.text);
            },
          ));
        },
        child: const Icon(
          Icons.add,
          color: CColors.white,
        ),
      ),
    );
  }
}
