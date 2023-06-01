import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


class CommonMethods {
  static String emailRegExp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String nameRegExp =
      r'^.{2,70}$';

  static String passwordRegExp =
      r'^.{8,15}$';

  static String mobileRegExp =
      r'^.{7,15}$';

  static String addressRegExp =
      r'^.{2,}$';

  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // showSnackBar(StringConstants.msgCheckConnection);
      return false;
    } else {
      return true;
    }
  }
}