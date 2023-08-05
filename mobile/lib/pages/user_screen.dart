import 'package:crud_flutter_app/base/no_user_page.dart';
import 'package:crud_flutter_app/controllers/user_controller.dart';
import 'package:crud_flutter_app/model/user_model.dart';
import 'package:crud_flutter_app/routes/route_helper.dart';
import 'package:crud_flutter_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../base/show_custom_snackbar.dart';
import '../widgets/header_widget.dart';
import '../widgets/icon_button_widget.dart';
import '../widgets/indicator_widget.dart';
import '../widgets/sub_text_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  Future<void> getAllUser() async {
    await Get.find<UserController>().getAllUsers();
  }

  Future<void> deleteUser(String id) async {
    await Get.find<UserController>().deleteUser(id).then((status) {
      if (status.isSuccess) {
        showCustomSnackBar('Succesfully deleted user', title: 'Successful!', isError: false);
        getAllUser();
      } else {
        showCustomSnackBar('User Deleted Failed');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getAllUser();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            //Header+search bar
            const HeaderWidget(
              title: 'User Manager',
              isTextfieldActive: true,
            ),
            //New User button
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, top: 10.h),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.person_add_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Get.toNamed(RouteHelper.getCreateUserPage());
                  },
                  label: const Text('Add User', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400)),
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            //Table Attributes
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, top: 14.h, right: 16.w),
                child: Container(
                  height: 33.h,
                  width: 312.h,
                  color: AppColors.mainDarkColor,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        const SubTextWidget(title: 'ID'),
                        SizedBox(width: 25.w),
                        const SubTextWidget(title: 'Name'),
                        SizedBox(width: 80.w),
                        const SubTextWidget(title: 'Status'),
                        SizedBox(width: 40.w),
                        const SubTextWidget(title: 'Action'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Table user values
            Expanded(
              child: GetBuilder<UserController>(
                builder: (userController) {
                  List<UserModel> userList = userController.userList;
                  return userList.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 35.w, right: 10.w),
                              child: SizedBox(
                                height: 20.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 3,
                                      child: SubTextWidget(title: '${index + 1}', color: Colors.black, fontSize: 17),
                                    ),
                                    Positioned(
                                        left: 40.w,
                                        top: 3,
                                        child: SubTextWidget(title: userList[index].name, color: Colors.black, fontSize: 16)),
                                    Positioned(
                                        left: 175.w,
                                        top: 3,
                                        child: IndicatorWidget(
                                            color: userList[index].status == 'Active'
                                                ? AppColors.activeColor
                                                : AppColors.inactiveColor)),
                                    Positioned(
                                        right: 15,
                                        top: 0,
                                        child: Row(
                                          children: [
                                            IconButtonWidget(
                                                icon: Icons.edit_outlined,
                                                onTap: () {
                                                  Get.toNamed(RouteHelper.getUpdateUserPage(userList[index].id.toString()));
                                                }),
                                            SizedBox(width: 5.w),
                                            IconButtonWidget(
                                                icon: Icons.delete_outline,
                                                onTap: () {
                                                  deleteUser(userList[index].id);
                                                }),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: userList.length)
                      : const NoUserPage();
                },
              ),
            ),
          ],
        ));
  }
}
