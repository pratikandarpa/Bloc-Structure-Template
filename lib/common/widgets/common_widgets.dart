// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../constants/font_constants.dart';

class CommonWidgets{


  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<bool> checkConnectivity() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   //showSnackBar(StringConstants.msgCheckConnection);
    //   return false;
    // } else {
      return true;
    // }
  }
}