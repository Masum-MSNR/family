import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../consts/c_colors.dart';

class SquareTextIconButton extends StatelessWidget {
  const SquareTextIconButton({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
    this.size = 120,
  });

  final Color color;
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30 * (size / 120)),
      ),
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30 * (size / 120)),
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
              offset: Offset(size / 2, size / 2),
              child: Transform.rotate(
                angle: 3.14 / 4,
                child: Container(
                  color: color,
                  height: size,
                  width: size,
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
                          height: size,
                          width: size,
                          color: color,
                          child: Stack(
                            children: [
                              Transform.translate(
                                offset: Offset(size / 2, size / 2),
                                child: Transform.rotate(
                                  angle: 3.14 / 4,
                                  child: Container(
                                    color: CColors.white,
                                    height: size,
                                    width: size,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        childSaveLayer: true,
                        blendMode: BlendMode.srcATop,
                        child: SizedBox(
                          height: size,
                          width: size,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    icon,
                                    size: size / 2.5,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    text,
                                    style: TextStyle(
                                      fontSize: 18 * (size / 120),
                                      fontWeight: FontWeight.w700,
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
  }
}
