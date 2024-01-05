import 'package:family/consts/c_colors.dart';
import 'package:family/ui/widgets/custom_button.dart';
import 'package:family/utils/card_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSheet extends StatefulWidget {
  const AddSheet({
    super.key,
    required this.onTap,
    required this.controller,
    required this.hint,
    required this.buttonText,
    this.formatted = false,
  });

  final String hint;
  final String buttonText;
  final VoidCallback onTap;
  final TextEditingController controller;
  final bool formatted;

  @override
  State<AddSheet> createState() => _AddSheetState();
}

class _AddSheetState extends State<AddSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width,
      decoration: const BoxDecoration(
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
                  inputFormatters: widget.formatted ? [KeyFormatter()] : [],
                  maxLength: widget.formatted ? 19 : null,
                  decoration: InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    hintText: widget.hint,
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
                buttonName: widget.buttonText,
                buttonColor: CColors.navyBlue,
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
