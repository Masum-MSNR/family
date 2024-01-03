import 'package:family/consts/c_colors.dart';
import 'package:family/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemSheet extends StatefulWidget {
  const AddItemSheet({
    super.key,
    required this.onTap,
    required this.controller,
  });

  final VoidCallback onTap;
  final TextEditingController controller;

  @override
  State<AddItemSheet> createState() => _AddItemSheetState();
}

class _AddItemSheetState extends State<AddItemSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: CColors.white,
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CColors.white,
                  border: Border.all(
                    color: CColors.navyBlue.withOpacity(0.5),
                  ),
                ),
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    hintText: 'Item name',
                    hintStyle: TextStyle(
                      color: CColors.black.withOpacity(0.5),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
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
              CustomButton(
                buttonName: 'Add',
                buttonColor: CColors.cyan,
                btnNameColor: CColors.white,
                onTap: widget.onTap,
                textSize: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
