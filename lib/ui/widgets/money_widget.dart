import 'package:flutter/material.dart';

import '../../consts/c_colors.dart';
import 'money_text.dart';

class MoneyWidget extends StatefulWidget {
  const MoneyWidget({
    super.key,
    required this.price,
    required this.isEditing,
    required this.onEdit,
    required this.onDone,
    required this.controller,
  });

  final String price;
  final bool isEditing;
  final VoidCallback onEdit;
  final VoidCallback onDone;
  final TextEditingController controller;

  @override
  State<MoneyWidget> createState() => _MoneyWidgetState();
}

class _MoneyWidgetState extends State<MoneyWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: widget.isEditing
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: CColors.black.withOpacity(0.1),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      decoration: InputDecoration(
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Text(
                            '৳',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
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
                    onTap: widget.onDone,
                    customBorder: const CircleBorder(),
                    child: const Icon(
                      Icons.check,
                      color: CColors.cyan,
                    ),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: widget.onEdit,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: CColors.black.withOpacity(0.1),
                  ),
                ),
                alignment: Alignment.center,
                child: MoneyText(money: widget.price),
              ),
            ),
    );
  }
}
