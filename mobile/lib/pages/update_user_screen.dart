import 'package:crud_flutter_app/base/show_custom_snackbar.dart';
import 'package:crud_flutter_app/model/user_model.dart';
import 'package:crud_flutter_app/utils/colors.dart';
import 'package:crud_flutter_app/widgets/header_widget.dart';
import 'package:crud_flutter_app/widgets/sub_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../routes/route_helper.dart';
import '../widgets/text_field_widget.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key, required this.id});

  final String id;

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

enum Gender { male, female }

enum Status { active, inactive }

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  Gender _gender = Gender.male;
  Status _status = Status.active;

  bool isChanged = false;

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> updateUser() async {
    UserModel user = await Get.find<UserController>().getUser(widget.id);

    if (user.name == nameController.text && user.email == emailController.text && isChanged == false) {
      showCustomSnackBar('No user changes updated', title: 'Alert');
      Get.toNamed(RouteHelper.getInitial());
      return;
    }

    UserModel userModel = UserModel(
        id: idController.text,
        name: nameController.text,
        status: _status == Status.active ? 'Active' : 'Inactive',
        gender: _gender == Gender.male ? 'Male' : 'Female',
        email: emailController.text);

    Get.find<UserController>().updateUser(userModel).then((status) {
      if (status.isSuccess) {
        showCustomSnackBar('User succesfully updated', title: 'Successful', isError: false);
      } else {
        showCustomSnackBar('Failed to update', title: 'Failed');
      }
    });
  }

  Future<void> getUser() async {
    UserModel user = await Get.find<UserController>().getUser(widget.id);
    idController.text = user.id;
    nameController.text = user.name;
    emailController.text = user.email;

    setState(() {
      _gender = user.gender == 'Male' ? Gender.male : Gender.female;
      _status = user.status == 'Active' ? Status.active : Status.inactive;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget(
            title: 'Update User',
            subTitle: 'Use the below form to update an account',
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.w, top: 22.h, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubTextWidget(title: 'ID', color: Colors.black54, fontSize: 18),
                TextFieldWidget(controller: idController, enabled: false),
                const SubTextWidget(title: 'Name', color: Colors.black54, fontSize: 18),
                TextFieldWidget(controller: nameController),
                const SubTextWidget(title: 'Email', color: Colors.black54, fontSize: 18),
                TextFieldWidget(controller: emailController),
                SizedBox(height: 5.h),
                //Gender
                Row(
                  children: [
                    const SubTextWidget(title: 'Gender', color: Colors.black54, fontSize: 18),
                    SizedBox(width: 23.w),
                    Radio<Gender>(
                        value: Gender.male,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value!;
                            isChanged = true;
                          });
                        }),
                    const SubTextWidget(
                      title: 'Male',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    SizedBox(width: 25.w),
                    Radio<Gender>(
                        value: Gender.female,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value!;
                            isChanged = true;
                          });
                        }),
                    const SubTextWidget(
                      title: 'Female',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                //Status
                Row(
                  children: [
                    const SubTextWidget(title: 'Status', color: Colors.black54, fontSize: 18),
                    SizedBox(width: 28.w),
                    Radio<Status>(
                        value: Status.active,
                        groupValue: _status,
                        onChanged: (Status? value) {
                          setState(() {
                            _status = value!;
                            isChanged = true;
                          });
                        }),
                    const SubTextWidget(
                      title: 'Active',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    SizedBox(width: 17.w),
                    Radio<Status>(
                        value: Status.inactive,
                        groupValue: _status,
                        onChanged: (Status? value) {
                          setState(() {
                            _status = value!;
                            isChanged = true;
                          });
                        }),
                    const SubTextWidget(
                      title: 'Inactive',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    updateUser();
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  onHover: (val) {
                    //Not Working
                    setState(() {
                      //updateUser();
                    });
                  },
                  child: Container(
                    width: 320.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: AppColors.mainGreenColor,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    //continue style
                    child: const Center(
                        child: SubTextWidget(
                      title: 'Save',
                      fontSize: 18,
                      color: Colors.black,
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
