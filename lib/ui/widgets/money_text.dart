import 'package:flutter/material.dart';

import '../../consts/c_colors.dart';

class MoneyText extends StatelessWidget {
  const MoneyText({
    super.key,
    required this.money,
  });

  final String money;

  @override
  Widget build(BuildContext context) {
    return Text(
      '৳ $money',
      style: const TextStyle(
        color: CColors.black,
        fontFamily: 'Poppins',
        fontSize: 14,
      ),
    );
  }
}
