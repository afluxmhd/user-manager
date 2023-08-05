import 'package:crud_flutter_app/controllers/user_controller.dart';
import 'package:crud_flutter_app/model/user_model.dart';
import 'package:crud_flutter_app/utils/colors.dart';
import 'package:crud_flutter_app/widgets/header_widget.dart';
import 'package:crud_flutter_app/widgets/sub_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../base/show_custom_snackbar.dart';
import '../routes/route_helper.dart';
import '../widgets/text_field_widget.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

enum Gender { male, female }

enum Status { active, inactive }

class _CreateUserScreenState extends State<CreateUserScreen> {
  Gender _gender = Gender.male;
  Status _status = Status.active;

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void createUser() {
    if (nameController.text.isEmpty) {
      showCustomSnackBar('Name is required');
    } else if (emailController.text.isEmpty) {
      showCustomSnackBar('Email is required');
    } else if (!GetUtils.isEmail(emailController.text)) {
      showCustomSnackBar('Enter valid email');
    } else {
      UserModel user = UserModel(
          id: '0',
          name: nameController.text,
          status: _status == Status.active ? 'Active' : 'Inactive',
          gender: _gender == Gender.male ? 'Male' : 'Female',
          email: emailController.text);

      Get.find<UserController>().createUser(user).then((status) {
        if (status.isSuccess) {
          showCustomSnackBar('New user added succesfully', title: 'Successful!', isError: false);
          Get.offNamed(RouteHelper.getInitial());
        } else {
          showCustomSnackBar('Failed to Add User', title: 'Failed');
          print('Failed! -> ${status.message}');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    idController.text = 'Auto Generated';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget(
            title: 'Create User',
            subTitle: 'Use the below form to create an account',
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
                    SizedBox(width: 28.w),
                    Radio<Gender>(
                        value: Gender.male,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value!;
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
                          });
                        }),
                    const SubTextWidget(
                      title: 'Active',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    SizedBox(width: 25.w),
                    Radio<Status>(
                        value: Status.inactive,
                        groupValue: _status,
                        onChanged: (Status? value) {
                          setState(() {
                            _status = value!;
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
                    createUser();
                  },
                  onHover: (val) {
                    //Not Working
                    setState(() {
                      //Hover button
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
