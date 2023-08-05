import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 20.h,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.r), boxShadow: [
        BoxShadow(
            color: const Color(0xff2E2E2E).withOpacity(0.08),
            blurRadius: 3.0,
            spreadRadius: 0.0,
            offset: const Offset(
              0.0,
              1.0,
            ))
      ]),
      child: GestureDetector(onTap: onTap, child: Icon(icon, size: 16)),
    );
  }
}
