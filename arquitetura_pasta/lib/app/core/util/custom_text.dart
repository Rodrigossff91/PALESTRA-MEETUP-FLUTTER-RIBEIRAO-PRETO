import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text == ''
          ? ''
          : "${newValue.text[0].toUpperCase()}${newValue.text.substring(1).toLowerCase()}",
      selection: newValue.selection,
    );
  }
}
