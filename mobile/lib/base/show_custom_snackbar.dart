import 'package:crud_flutter_app/utils/colors.dart';
import 'package:crud_flutter_app/widgets/sub_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true, String title = 'Error'}) {
  Get.snackbar(title, message,
      titleText: Text(title, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.85), fontSize: 20)),
      messageText: SubTextWidget(title: message, fontSize: 14, color: Colors.white.withOpacity(0.70)),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      borderRadius: 4.r,
      backgroundColor: isError ? Colors.red : AppColors.mainDarkColor);
}
