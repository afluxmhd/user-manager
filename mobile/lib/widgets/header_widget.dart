import 'package:crud_flutter_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    this.subTitle = "",
    this.isTextfieldActive = false,
  });

  final String title;
  final String subTitle;
  final bool isTextfieldActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isTextfieldActive ? 160.h : 160.h,
          width: 345.w,
          color: Colors.greenAccent,
        ),
        Positioned(
          top: isTextfieldActive ? 70.h : 106.h,
          left: 15.w,
          child: Text(title, style: const TextStyle(fontSize: 26)),
        ),
        subTitle != ""
            ? Positioned(
                top: 132.h,
                left: 15.w,
                child: Text(subTitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              )
            : const SizedBox(),
        isTextfieldActive
            ? Positioned(
                top: 105.h,
                left: 12.w,
                right: 19.w,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search, color: AppColors.mainDarkColor),
                    hintText: 'Search User',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.r),
                        borderSide: BorderSide(color: const Color(0xff2B2D42).withOpacity(0.9), width: 0.3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.r),
                        borderSide: BorderSide(color: const Color(0xff2B2D42).withOpacity(0.9), width: 0.3)),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
