import 'package:bloc_structure_template/common/constants/color_constants.dart';
import 'package:bloc_structure_template/common/constants/font_constants.dart';
import 'package:bloc_structure_template/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void successSnackBar(String message,[BuildContext? context]) {
  ScaffoldMessenger.of(context ?? navState.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: ColorConstants.greenFont,
        dismissDirection: DismissDirection.down,
        elevation: FontConstants.font_8,
        behavior: SnackBarBehavior.floating,
      )
  );
}

void errorSnackBar(String message,[BuildContext? context]) {
  ScaffoldMessenger.of(context ?? navState.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: ColorConstants.redFont,
        dismissDirection: DismissDirection.down,
        elevation: FontConstants.font_8,
        behavior: SnackBarBehavior.floating,
      )
  );
}

class InitialSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue;
    var length = newText.text.length;
    if (length <= 1) {
      if (newValue.text.toString().contains(' ')) {
        return oldValue;
      } else {
        return newValue;
      }
    } else {
      return newValue;
    }
  }
}

class InitialZeroInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue;
    var length = newText.text.length;
    if (length <= 1) {
      if (newValue.text.toString().contains("0")) {
        return oldValue;
      } else {
        return newValue;
      }
    } else {
      if (newValue.text.toString().contains("000")) {
        return oldValue;
      } else {
        return newValue;
      }
    }
  }
}