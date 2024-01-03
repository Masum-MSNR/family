import 'package:family/consts/c_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    required this.btnNameColor,
    required this.textSize,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String buttonName;
  final Color btnNameColor;
  final double textSize;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              splashColor: CColors.navyBlue.withOpacity(0.5),
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Text(
                  buttonName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: textSize,
                    color: btnNameColor,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
