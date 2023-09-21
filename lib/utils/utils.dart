import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_zone_task/src/widgets/error_bottom_sheet.dart';

void showErrorDialog({
  String? title,
  String? subtitle,
  String? negativeBtnTitle,
  String? positiveBtnTitle,
  bool barrierDismissible = false,
  Function()? onPositiveTapped,
  Function()? onNegativeTapped,
}) async {
  await showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    isDismissible: barrierDismissible,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    builder: (BuildContext context) {
      return ErrorBottomSheet(
        title: title,
        subtitle: subtitle,
        negativeBtnTitle: negativeBtnTitle,
        positiveBtnTitle: positiveBtnTitle,
        onPositiveTapped: onPositiveTapped,
        onNegativeTapped: onNegativeTapped,
      );
    },
  );
}
