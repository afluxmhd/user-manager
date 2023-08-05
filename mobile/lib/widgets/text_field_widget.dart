import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.enabled = true,
  });

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.h, bottom: 18.h),
      child: TextField(
        enabled: enabled,
        controller: controller,
        style: TextStyle(color: enabled ? Colors.black : Colors.grey, fontSize: 18),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: enabled ? 10.w : 5.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.r),
              borderSide: BorderSide(color: const Color(0xff2B2D42).withOpacity(0.9), width: 0.3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.r),
              borderSide: BorderSide(color: const Color(0xff2B2D42).withOpacity(0.9), width: 0.3)),
        ),
      ),
    );
  }
}
