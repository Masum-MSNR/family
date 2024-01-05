import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../consts/c_colors.dart';

class FancyButton extends StatelessWidget {
  const FancyButton({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.height,
  });

  final Color color;
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Container(
          height: height,
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height / 2),
            color: CColors.white,
            boxShadow: [
              BoxShadow(
                color: CColors.navyBlue.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(height / 2.5, height),
                child: Transform.rotate(
                  angle: -tan(50 / constraints.maxWidth),
                  child: Container(
                    color: color,
                    height: height,
                  ),
                ),
              ),
              Material(
                color: CColors.transparent,
                child: InkWell(
                  onTap: onTap,
                  splashColor: CColors.navyBlue.withOpacity(0.2),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WidgetMask(
                          mask: Container(
                            height: height,
                            color: color,
                            child: Stack(
                              children: [
                                Transform.translate(
                                  offset: Offset(height / 2.5, height),
                                  child: Transform.rotate(
                                    angle: -tan(50 / constraints.maxWidth),
                                    child: Container(
                                      color: CColors.white,
                                      height: height,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          childSaveLayer: true,
                          blendMode: BlendMode.srcATop,
                          child: SizedBox(
                            height: height,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      text,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
