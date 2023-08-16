import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/utils/common_colors.dart';
import 'package:task1/utils/custom_loader.dart';


void updateStatusBarColor(BuildContext context, {bool? fromSplash = false}) {
  if (fromSplash == true) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness:
            isDarkTheme(context) ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            isDarkTheme(context) ? Brightness.light : Brightness.dark,
        statusBarColor: isDarkTheme(context)
            ? CommonColors.colorBlackShade1
            : CommonColors.colorOrangeShade2,
        systemStatusBarContrastEnforced: true));
  } else {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness:
            isDarkTheme(context) ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            isDarkTheme(context) ? Brightness.light : Brightness.dark,
        statusBarColor: isDarkTheme(context)
            ? CommonColors.colorBlackShade1
            : CommonColors.colorWhiteShade3,
        systemStatusBarContrastEnforced: true));
  }
}

bool isDarkTheme(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return isDarkMode;
}

void hideKeyboard({required BuildContext context}) {
  FocusScope.of(context).unfocus();
}

bool isValidEmail(String email) {
  String validity =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(validity);

  return regExp.hasMatch(email);
}

BuildContext? _progressContext;

Future<void> showLoaderDialog(
  BuildContext? context, {
  Color? loaderColor,
  Color? barrierColor,
}) async {
  if (_progressContext == null && context != null) {
    await showDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor ?? Colors.black12.withOpacity(0.2),
      useSafeArea: true,
      useRootNavigator: true,
      builder: (context) {
        _progressContext = context;
        return SafeArea(
          child: WillPopScope(
            onWillPop: () async => false,
            child: CustomLoader(
                bgColor: barrierColor ?? Colors.black12.withOpacity(0.2)),
          ),
        );
      },
    );
  }
}
void hideLoaderDialog({BuildContext? context}) {
  if (_progressContext != null) {
    // log("context is not null");
    try {
      Navigator.of(context ?? _progressContext!).pop(true);
    } catch (e) {
      debugPrint("error => $e");
    }
    _progressContext = null;
  } else if (context != null) {
    Navigator.of(context).pop(true);
  } else {
    // log("context is null");
  }
}
