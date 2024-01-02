import 'package:family/models/shopping_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../consts/c_colors.dart';
import 'money_widget.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.onEdit,
    required this.onDone,
  });

  final ShoppingModel item;
  final VoidCallback onEdit;
  final VoidCallback onDone;

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
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
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
                      value: true,
                      onChanged: (value) {},
                    ),
                    Expanded(
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
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: MoneyWidget(
                  price: widget.item.itemPrice!,
                  isEditing: widget.item.isEditing!,
                  onEdit: widget.onEdit,
                  onDone: widget.onDone,
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
