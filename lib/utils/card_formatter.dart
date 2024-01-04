import 'package:flutter/services.dart';

class KeyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.toLowerCase().replaceAll('-', '');
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i == 4 || i == 8 || i == 12) {
        buffer.write('-');
      }
      buffer.write(newText[i]);
    }
    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
