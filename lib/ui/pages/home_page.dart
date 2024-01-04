import 'package:family/consts/c_colors.dart';
import 'package:family/ui/widgets/custom_outlined_button.dart';
import 'package:family/ui/widgets/popups/add_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          color: CColors.white,
        ),
        title: const Text(
          'Shopping List',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: CColors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 100,
            right: 16,
            left: 16,
          ),
          itemCount: _controller.itemLists.length,
          itemBuilder: (context, index) {
            return ItemTile(
              item: _controller.itemLists[index],
              onDone: (value) {
                _controller.itemLists[index].isDone = value;
                _controller.itemLists.refresh();
              },
              onPriceTap: () {
                _controller.itemLists[index].isPriceEditing = true;
                _controller.itemLists.refresh();
              },
              onPriceEditDone: () {
                _controller.itemLists[index].itemPrice =
                    _controller.itemLists[index].itemPriceController!.text;
                _controller.itemLists[index].isPriceEditing = false;
                _controller.itemLists.refresh();
              },
              onNameTap: () {
                _controller.itemLists[index].isNameEditing = true;
                _controller.itemLists.refresh();
              },
              onNameEditDone: () {
                _controller.itemLists[index].itemName =
                    _controller.itemLists[index].itemNameController!.text;
                _controller.itemLists[index].isNameEditing = false;
                _controller.itemLists.refresh();
              },
              onDelete: () {
                _controller.itemLists.removeAt(index);
                _controller.itemLists.refresh();
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.navyBlue,
        onPressed: () {
          final itemNameController = TextEditingController();
          Get.bottomSheet(AddSheet(
            buttonText: 'Add',
            hint: 'Item Name',
            controller: itemNameController,
            onTap: () {
              if (_controller.addItem(itemNameController.text)) {
                Get.back();
              } else {
                Get.showSnackbar(
                  const GetSnackBar(
                    message: 'Please enter item name',
                    backgroundColor: CColors.navyBlue,
                    duration: Duration(seconds: 2),
                  ),
                );
              }
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
