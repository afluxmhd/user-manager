import 'package:crud_flutter_app/widgets/sub_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoUserPage extends StatelessWidget {
  const NoUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: SubTextWidget(title: '  No User Available ', color: Colors.black),
        ),
        const Center(
          child: SubTextWidget(
            title: ' Create new user using new user button ',
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 30.h)
      ],
    );
  }
}
