import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_veer/utils/colors.dart';

pleaseWait({title}) {
  Get.defaultDialog(
    title: title ?? 'Plese Wait...',
    custom: const CircularProgressIndicator(
      color: kNavyBlue,
    ),
    content: const CircularProgressIndicator(
      color: kNavyBlue,
    ),
    barrierDismissible: false,
    onWillPop: () async {
      return true;
    },
  );
}
