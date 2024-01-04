import 'package:family/consts/c_colors.dart';
import 'package:family/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16)
                  .copyWith(top: 20),
              decoration: const BoxDecoration(
                color: CColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Material(
                color: CColors.transparent,
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      color: CColors.cyan,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${message}...',
                      style: TextStyle(
                        color: CColors.cyan,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
