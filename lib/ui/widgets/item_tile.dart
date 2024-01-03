import 'package:family/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../consts/c_colors.dart';
import 'money_widget.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.onDone,
    required this.onPriceTap,
    required this.onPriceEditDone,
    required this.onNameTap,
    required this.onNameEditDone,
    required this.onDelete,
  });

  final ItemModel item;
  final Function(bool?) onDone;
  final VoidCallback onPriceTap;
  final VoidCallback onPriceEditDone;
  final VoidCallback onNameTap;
  final VoidCallback onNameEditDone;
  final VoidCallback onDelete;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: CColors.white,
        boxShadow: [
          BoxShadow(
            color: CColors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.onDelete.call();
              },
              backgroundColor: CColors.red,
              foregroundColor: CColors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: CColors.cyan,
                      checkColor: CColors.white,
                      value: widget.item.isDone,
                      onChanged: widget.onDone,
                    ),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: widget.item.isNameEditing == false
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: widget.onNameTap,
                                  child: Text(
                                    widget.item.itemName!,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: CColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller:
                                          widget.item.itemNameController!,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        isCollapsed: true,
                                        hintStyle: TextStyle(
                                          color: CColors.black.withOpacity(0.5),
                                          fontFamily: 'Poppins',
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(
                                        color: CColors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                      ),
                                      autofocus: true,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: widget.onNameEditDone,
                                    customBorder: const CircleBorder(),
                                    child: const Icon(
                                      Icons.check,
                                      color: CColors.cyan,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: MoneyWidget(
                  price: widget.item.itemPrice!,
                  isEditing: widget.item.isPriceEditing!,
                  onEdit: widget.onPriceTap,
                  onDone: widget.onPriceEditDone,
                  controller: widget.item.itemPriceController!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
