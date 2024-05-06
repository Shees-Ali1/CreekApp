import 'dart:io';

import 'package:creekapp/const/color.dart';
import 'package:creekapp/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/assets/image_assets.dart';
import '../../../const/assets/svg_assets.dart';
import '../../../controller/login_auth_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/password_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final LoginAuthController loginVM = Get.find<LoginAuthController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  File? _imageFile;
  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(children: [
        ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
                height: 160.h,
                // padding: EdgeInsets.symmetric(vertical: 50.h),
                decoration: BoxDecoration(
                    color: Color(0xff29604E),
                    image: DecorationImage(
                        image: AssetImage(AppImages.appbardesign),
                        fit: BoxFit.cover)),
                child: SafeArea(
                  child: Column(children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset(AppIcons.drawericon),
                      SizedBox(
                        width: 20.w,
                      ),
                      CustomText(
                        text: 'Edit Profile',
                        textColor: Colors.white,
                        fontsize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      SvgPicture.asset(AppIcons.chaticon),
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset(AppIcons.notificationIcon),
                      SizedBox(
                        width: 23.w,
                      ),
                    ]),
                  ]),
                )))
      ]),
      SizedBox(
        height: 17.h,
      ),
      Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _imageFile != null
                ? Container(
                    height: 101.78.h,
                    width: 101.78.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        _imageFile!,
                        height: 14.h,
                        width: 26.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Image.asset(
                    AppImages.profile,
                    height: 106.h,
                    width: 106.w,
                  ),
            Positioned(
                right: 0,
                bottom: -5,
                child: GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: SvgPicture.asset(AppIcons.editcameraIcon)))
          ],
        ),
      ),
      SizedBox(
        height: 15.h,
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextThree(
              text: 'Name',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: Color(0xff1E1E1E),
            ),
            SizedBox(
              height: 8.h,
            ),
            InputField(
              controller: nameController,
              hint: 'Enter Name',
              keyboard: TextInputType.emailAddress,
              hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextThree(
              text: 'Email Address',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: Color(0xff1E1E1E),
            ),
            SizedBox(
              height: 8.h,
            ),
            InputField(
              controller: nameController,
              hint: 'Enter Email Address',
              keyboard: TextInputType.emailAddress,
              hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextThree(
              text: 'School Name',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: Color(0xff1E1E1E),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: double.infinity,
              height: 58.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Color(0xff29604E).withOpacity(0.06),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextThree(
                    text: 'Harker',
                    fontWeight: FontWeight.w400,
                    fontsize: 16.sp,
                    textColor: Colors.black,
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
            // InputField(
            //   controller: nameController,
            //   hint: 'Enter Name',
            //   keyboard: TextInputType.emailAddress,
            //   hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
            // ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextThree(
              text: 'Password',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: Color(0xff1E1E1E),
            ),
            SizedBox(
              height: 8.h,
            ),
            Obx(() {
              return PasswordField(
                onTap: () => loginVM.eyeIconLogin(),
                controller: passwordController,
                keyboard: TextInputType.text,
                isObscure: !loginVM.loginObscure.value,
                trailIcon: loginVM.loginObscure.value
                    ? SvgPicture.asset(AppIcons.passwordeyeIcon)
                    : const Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                      ),
                hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
                hint: 'Enter Password',
              );
            }),
            SizedBox(
              height: 38.h,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        height: 241.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              width: 30.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(4.r)),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFour(
                              text: 'Confirm changes?',
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black,
                              fontsize: 20.sp,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextFour(
                              text:
                                  'They will be sent to admin team to be approved again',
                              fontWeight: FontWeight.w400,
                              textColor: Colors.black,
                              fontsize: 12.sp,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            CustomButton(
                                text: 'Yes',
                                onPressed: () {},
                                backgroundColor: primaryColor,
                                textColor: whiteColor),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomButton(
                                text: 'Back',
                                onPressed: () {},
                                backgroundColor: primaryColor.withOpacity(0.2),
                                textColor: whiteColor),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                width: double.infinity,
                height: 58.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: CustomTextThree(
                    text: 'Change',
                    fontWeight: FontWeight.w500,
                    fontsize: 16.sp,
                    textColor: whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ])));
  }
}