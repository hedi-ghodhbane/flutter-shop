import 'package:flutter/material.dart';
import 'package:get/get.dart';
/// show loading dialog box to user 
showLoading() => Get.defaultDialog(
      title: "Loading...",
      content: Center(child: CircularProgressIndicator()),
    );
/// remove the loading dialog
dismissLoading() {
  Get.back();
}
