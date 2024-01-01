import 'package:family/consts/c_colors.dart';
import 'package:family/ui/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../controllers/home_page_controller.dart';

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
        title: const Text(
          'Shopping List',
          style: TextStyle(
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
              onEdit: () {
                _controller.itemLists[index].isEditing = true;
                _controller.itemLists.refresh();
              },
              onDone: () {
                _controller.itemLists[index].itemPrice =
                    _controller.itemLists[index].itemPriceController!.text;
                _controller.itemLists[index].isEditing = false;
                _controller.itemLists.refresh();
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.cyan,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: CColors.white,
        ),
      ),
    );
  }
}
