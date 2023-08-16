
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/utils/common_colors.dart';
import 'package:task1/utils/text_styles.dart';


class CustomSnackBar {
  errorSnackBar({String title = "Error", String message = ""}) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2000),
      dismissDirection: DismissDirection.endToStart,
      backgroundColor: Colors.red,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      content: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading:
            const Icon(Icons.warning, color: CommonColors.colorWhiteShade1),
        title: Text(title,
            style: TextStyles.textStyleBold16
                .apply(color: CommonColors.colorWhiteShade1)),
        subtitle: Text(
          message,
          style: TextStyles.textStyleRegular16
              .apply(color: CommonColors.colorWhiteShade1),
        ),
        trailing: InkWell(onTap: () {}, child: const Icon(Icons.close)),
      ),
    ));
  }

  snackbarSuccess({String title = "Success", String message = ""}) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2000),
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: Colors.green,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      content: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.done_outline,
            color: CommonColors.colorWhiteShade1),
        title: Text(title,
            style: TextStyles.textStyleBold16
                .apply(color: CommonColors.colorWhiteShade1)),
        subtitle: Text(
          message,
          style: TextStyles.textStyleRegular16
              .apply(color: CommonColors.colorWhiteShade1),
        ),
        trailing: InkWell(onTap: () {}, child: const Icon(Icons.close)),
      ),
      /*  action: SnackBarAction(
          label: '✕',
          onPressed: () {
            // Some code to undo the change.
          }), */
    ));
  }
}
